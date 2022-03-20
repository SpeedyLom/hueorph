extends Control

onready var _music_slider = $VBoxContainer/HBoxContainer/MusicSlider
onready var _sound_slider = $VBoxContainer/HBoxContainer2/SoundSlider

func _ready():
	_music_slider.value = int(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	_sound_slider.value = int(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Sounds")))

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


func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)


func _on_SoundSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sounds"), value)
