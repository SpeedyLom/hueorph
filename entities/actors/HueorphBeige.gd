class_name HueorphBeige
extends KinematicBody2D

enum {
	IDLE,
	WALK,
}

export var acceleration: int = 800
export var gravity: int = 500
export var friction: int = 1800
export var run_speed: int = 380

var _state: int = WALK
var _velocity: Vector2 = Vector2()

onready var _animated_sprite: AnimatedSprite = $AnimatedSprite


func _physics_process(delta: float) -> void:
	match _state:
		IDLE:
			_idle(delta)
		WALK:
			_walk(delta)

func _idle(delta: float) -> void:
	_move(delta)

func _walk(delta: float) -> void:
	_set_walk_velocity_by_input(delta)
	_animate_walk_by_velocity()
	_move(delta)


func _set_walk_velocity_by_input(delta: float) -> void:
	var _input_vector := _get_normalized_vector_by_input()
	var _run_delta := friction * delta
	var _run_vector := Vector2()

	if _walking(_input_vector):
		_run_delta = acceleration * delta
		_run_vector = _input_vector * run_speed

	_velocity = _velocity.move_toward(_run_vector, _run_delta)


func _get_normalized_vector_by_input() -> Vector2:
	var _input_vector := Vector2()
	_input_vector.x = _get_x_vector_by_input()

	return _input_vector.normalized()


func _get_x_vector_by_input() -> float:
	var _x_vector := Input.get_action_strength("ui_right")
	_x_vector -= Input.get_action_strength("ui_left")

	return _x_vector


func _walking(_input_vector: Vector2) -> bool:
	return _input_vector.length() > 0


func _animate_walk_by_velocity() -> void:
	if _velocity.x:
		_animated_sprite.flip_h = _velocity.x < 0

	_animated_sprite.animation = _get_animation_name_from_velocity()


func _get_animation_name_from_velocity() -> String:
	if _velocity.x:
		return "walk"

	return "idle"


func _move(delta: float) -> void:
	_velocity.y += delta * gravity
	_velocity = move_and_slide(_velocity, Vector2(0, -1))
