extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var _new_pause_state = not get_tree().paused
		get_tree().paused = _new_pause_state
		visible = _new_pause_state
		$VBoxContainer/ContinueButton.grab_focus()

func _on_ContinueButton_pressed():
	visible = false
	get_tree().paused = false


func _on_RestartButton_pressed():
	_on_ContinueButton_pressed()
	get_tree().change_scene("res://entities/levels/Level0.tscn")
