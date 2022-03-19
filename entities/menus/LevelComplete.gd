extends Control

func _on_RestartButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://entities/levels/Level0.tscn")

func _on_LevelComplete_visibility_changed():
	if visible == true:
		get_tree().paused = true
		$Panel/VBoxContainer/RestartButton.grab_focus()

