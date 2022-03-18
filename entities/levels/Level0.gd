extends Node2D

func _ready():
	HueorphGame.connect("no_health", self, "_restart")

func _restart():
	get_tree().reload_current_scene()
