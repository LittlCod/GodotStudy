extends Node2D

@export var speed : int = 30
var dir : int = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCastRight.is_colliding() || $RayCastLeft.is_colliding():
		$Spr.flip_h = !$Spr.flip_h
		dir = -dir
	position.x += dir * speed * delta
