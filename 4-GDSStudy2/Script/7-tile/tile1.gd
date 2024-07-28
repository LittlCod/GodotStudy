# 寻路1
extends Node2D

@onready var player = $Player
@onready var line_2d = $Line2D
@onready var player_nav = $Player/PlayerNav
var speed = 200
# 射线长度，范围
var scope = 60

func _unhandled_input(event: InputEvent) -> void:
	# 鼠标左键按下
	if(event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
		# var player_position = player.global_position
		var mouse_position = event.global_position
		player_nav.target_position = mouse_position
		player_nav.get_next_path_position()
		var nav_path = player_nav.get_current_navigation_path()
		line_2d.points = nav_path

func _physics_process(delta):
	# 检测导航是否正在进行
	if player_nav.is_navigation_finished() || player_nav.get_final_position() == Vector2.ZERO:
		return
	
	var next_position = player_nav.get_next_path_position()
	var direction = player.global_position.direction_to(next_position)
	
	player.velocity = direction * speed
	player.move_and_slide()
