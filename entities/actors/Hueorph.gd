extends KinematicBody2D

const Poof := preload("res://entities/components/Poof.tscn")

enum {
	IDLE,
	WALK,
	HURT,
}

export (int) var _base_run_speed = 250
export (int) var _base_jump_speed = -500
export (int) var _gravity = 1200

var _velocity = Vector2()
var _jump_speed = 0
var _run_speed = 0
var _jumping = false
var _colour = 'beige'
var _state = IDLE

onready var _animated_sprite: AnimatedSprite = $AnimatedSpriteBeige
onready var _animated_sprite_beige: AnimatedSprite = $AnimatedSpriteBeige
onready var _animated_sprite_blue: AnimatedSprite = $AnimatedSpriteBlue
onready var _animated_sprite_green: AnimatedSprite = $AnimatedSpriteGreen
onready var _animated_sprite_pink: AnimatedSprite = $AnimatedSpritePink
onready var _audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
onready var _hurtBox: Area2D = $HurtBox

signal combine(colour, hexadecimal)

func _ready() -> void:
	_jump_speed = _base_jump_speed
	_run_speed = _base_run_speed
	HueorphGame.connect("no_health", self, "_die")

func _die():
	_animated_sprite.hide()

func get_input():
	_velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed("ui_accept")

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

	if _state == HURT:
		_animated_sprite.animation = 'hurt'

func _physics_process(delta):
	get_input()
	_velocity.y += _gravity * delta
	if _jumping and is_on_floor():
		_jumping = false

	_velocity = move_and_slide(_velocity, Vector2(0, -1), true)


func _on_Hueorph_combine(colour: String, hexadecimal: String):
	if _colour != 'beige':
		_audio_stream_player_2d.play()
		_create_poof_effect(colour, hexadecimal)

	_animated_sprite.visible = false
	_colour = colour

	match(colour):
		'blue':
			_animated_sprite = _animated_sprite_blue
			_jump_speed = _base_jump_speed
			_run_speed = _base_run_speed * 2
		'green':
			_animated_sprite = _animated_sprite_green
			_jump_speed = _base_jump_speed * 1.8
			_run_speed = _base_run_speed
		'pink':
			_animated_sprite = _animated_sprite_pink
			_jump_speed = _base_jump_speed
			_run_speed = _base_run_speed
		'beige':
			_animated_sprite = _animated_sprite_beige
			_jump_speed = _base_jump_speed
			_run_speed = _base_run_speed
			_animated_sprite.animation = 'hurt'

	_animated_sprite.visible = true

func _create_poof_effect(colour: String, hexadecimal: String):
	var _poof := Poof.instance()

	_poof.change_colour(Color(hexadecimal))

	self.add_child(_poof)
	_poof.global_position = global_position


func _on_HurtBox_invincibility_ended():
	pass


func _on_HurtBox_invincibility_started():
	pass # Replace with function body.


func _on_HurtBox_area_entered(area):
	_on_Hueorph_combine('beige', '#ded0ae')
	_animated_sprite.animation = 'hurt'
	HueorphGame.health -= area.damage
	_hurtBox.start_invincibility(0.6)


	#var playerHurtSound = PlayerHurtSound.instance()
	#get_tree().current_scene.add_child(playerHurtSound)


func _on_AnimatedSpriteBeige_animation_finished():
	_state = IDLE
