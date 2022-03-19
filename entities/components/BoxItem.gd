extends Area2D

export var changer = "res://entities/actors/GreenChanger.tscn"

func _on_HurtBox_body_entered(body):
	$AnimatedSprite.animation = "disabled"

