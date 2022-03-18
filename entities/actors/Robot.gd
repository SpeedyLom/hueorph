class_name Robot
extends KinematicBody2D

enum {
	IDLE
	CHASE,
}

const Poof := preload("res://entities/components/Poof.tscn")

export (int) var _chase_speed = 150
export (int) var _gravity = 1200

var _state: int = IDLE
var _velocity: Vector2 = Vector2()

onready var _player_detection_area: Area2D = $PlayerDetectionArea
onready var _animated_sprite: AnimatedSprite = $AnimatedSprite

func _physics_process(delta: float) -> void:
	match _state:
		IDLE:
			_look_for_player()

		CHASE:
			_chase_player(delta)

	_move(delta)


func _look_for_player() -> void:
	if _player_detected():
		_begin_to_chase_player()


func _player_detected() -> bool:
	return _player_detection_area.player_detected()


func _begin_to_chase_player() -> void:
	_state = CHASE


func _chase_player(delta: float) -> void:
	if _cant_find_player():
		_become_idle()
		return

	_set_velocity_towards_player(delta)
	_animate_chase_by_velocity()


func _cant_find_player() -> bool:
	return _player_detected() == false


func _become_idle() -> void:
	_state = IDLE


func _set_velocity_towards_player(delta: float) -> void:
	_velocity.x = _get_player_direction().x * _chase_speed


func _get_player_direction() -> Vector2:
	var _player = _player_detection_area.get_player()
	if _player == null:
		return Vector2()

	return global_position.direction_to(_player.global_position)


func _animate_chase_by_velocity():
	if _chasing():
		_animated_sprite.animation = 'walk'
		_animated_sprite.flip_h = _velocity.x < 0
	else:
		_animated_sprite.animation = 'idle'


func _chasing() -> bool:
	return _velocity.length() > 0


func _move(delta: float) -> void:
	_velocity.y += _gravity * delta
	_velocity.normalized()

	_velocity = move_and_slide(_velocity, Vector2.UP, true)


func _on_HitBox_area_entered(area):
	_create_poof_effect()


func _create_poof_effect():
	var _poof := Poof.instance()
	_poof.connect('animation_finished', self, "queue_free")

	_poof.change_colour(Color('#5393c5'))

	self.add_child(_poof)
	_poof.global_position = global_position
