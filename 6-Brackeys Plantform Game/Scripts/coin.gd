extends Area2D

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.name != "Player":
		return
	$Coin.play()
	queue_free()
