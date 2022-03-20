extends Control

func _on_RestartButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://entities/levels/Level0.tscn")

func _on_LevelComplete_visibility_changed():
	if visible == true:
		get_tree().paused = true
		$Panel/VBoxContainer/RestartButton.grab_focus()

		var time = HueorphGame.time
		var seconds = fmod(time, 60)
		var minutes = fmod(time, 60 * 60) / 60

		$Panel/VBoxContainer/HBoxContainer2/TimeLabel.text = "%02d:%02d" % [minutes, seconds]

		$Panel/VBoxContainer/HBoxContainer/ScoreLabel.text = "%d" % [HueorphGame.score]

