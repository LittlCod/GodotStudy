extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
# %通过唯一路径访问
@onready var game_manager: Node = %GameManager

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.name != "Player":
		return
	game_manager.add_score()
	animation_player.current_animation = "pick_up"
