extends Node

var score = 0
export(int) var max_health := 3 setget set_max_health
var health := max_health setget set_health

signal score_increase
signal no_health
signal health_changed(value)
signal max_health_changed(value)

func _on_HueorphGame_score_increase():
	score += 1

func increase_score():
	score += 1

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)

func _ready():
	connect("no_health", self, "reset_scores")
	self.health = max_health

func _reset_score():
	score = 0

func reset_scores():
	set_health(max_health)
	_reset_score()

