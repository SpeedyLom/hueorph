extends Control

var hearts := 3 setget set_hearts
var max_hearts := 3 setget set_max_hearts

onready var heartUIFull := $HeartUIFull
onready var heartUIEmpty := $HeartUIEmpty

func _process(delta):
	$Score.text = String(HueorphGame.score)

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 53

func set_max_hearts(value):
	max_hearts = max(value, 1)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_hearts * 53

func _ready():
	self.max_hearts = HueorphGame.max_health
	self.hearts = HueorphGame.health
	HueorphGame.connect("health_changed", self, "set_hearts")
	HueorphGame.connect("max_health_changed", self, "set_max_hearts")
