extends Area2D

# 即死
@export var instantDeath : bool = false
@export var blood_hit : int = 1

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return
	if instantDeath:
		body.death_fn()
	else:
		body.hit_fn(blood_hit)
