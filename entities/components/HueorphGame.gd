extends Node

var score = 0

signal score_increase

func _on_HueorphGame_score_increase():
	score += 1

func increase_score():
	score += 1
