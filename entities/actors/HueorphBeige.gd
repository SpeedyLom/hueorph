extends KinematicBody2D

export (int) var _run_speed = 250
export (int) var _jump_speed = -400
export (int) var _gravity = 1200

var _velocity = Vector2()
var _jumping = false

onready var _animated_sprite: AnimatedSprite = $AnimatedSprite

func get_input():
	_velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')

	if jump and is_on_floor():
		_jumping = true
		_velocity.y = _jump_speed
		_animated_sprite.animation = 'jump'
	if right:
		_velocity.x += _run_speed
	if left:
		_velocity.x -= _run_speed

	if _velocity.x:
		_animated_sprite.animation = 'walk'
		_animated_sprite.flip_h = _velocity.x < 0
	else:
		_animated_sprite.animation = 'idle'

func _physics_process(delta):
	get_input()
	_velocity.y += _gravity * delta
	if _jumping and is_on_floor():
		_jumping = false

	_velocity = move_and_slide(_velocity, Vector2(0, -1), true)
