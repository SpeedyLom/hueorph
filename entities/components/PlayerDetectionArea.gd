class_name PlayerDetectionArea
extends Area2D

var _player = null


func get_player() -> CollisionObject2D:
	return _player

func player_detected() -> bool:
	return _player != null


func _on_PlayerDetectionArea_body_entered(body: CollisionObject2D):
	_player = body


func _on_PlayerDetectionArea_body_exited(_body: CollisionObject2D):
	_player = null
