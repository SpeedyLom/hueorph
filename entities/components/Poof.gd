extends AnimatedSprite

func _ready():
	connect("animation_finished", self, "_on_animation_finished")
	play("poof")

func _on_animation_finished():
	queue_free()

func change_colour(colour: Color):
	self.modulate = colour
