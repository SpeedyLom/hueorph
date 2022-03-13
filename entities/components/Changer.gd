extends Area2D

export var colour: String = 'beige'
export var hexadecimal: String = '#ffffff'

onready var _hueorph = get_parent().get_node('Hueorph')

func _on_Changer_body_entered(_body):
	_hueorph.emit_signal("combine", colour, hexadecimal)

