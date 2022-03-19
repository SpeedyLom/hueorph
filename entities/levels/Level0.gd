extends Node2D

func _ready():
	HueorphGame.connect("no_health", self, "_gameover")
	#$BackgroundMusic.play()

func _restart():
	get_tree().reload_current_scene()

func _gameover():
	$GameoverSound.play()

func _on_GameoverSound_finished():
	_restart()

func _on_GameEnd_body_entered(body):
	$CanvasLayer/LevelComplete.visible = true
