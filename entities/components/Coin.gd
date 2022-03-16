extends Area2D


func _on_Coin_body_entered(body):
	$AudioStreamPlayer2D.play()
	HueorphGame.increase_score()


func _on_AudioStreamPlayer2D_finished():
	queue_free()
