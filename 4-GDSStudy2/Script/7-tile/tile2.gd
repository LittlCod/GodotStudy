# 寻路1
extends Node2D

@onready var player = $Player
@onready var line_2d = $Line2D
@onready var player_nav = $Player/PlayerNav
var speed = 500
# 射线长度，范围
var scope = 60

var ray_direction = []
var direction = Vector2.ZERO
var last_position = Vector2.ZERO

func _ready():
	# 初始化射线方向
	ray_direction.resize(8)
	for i in 8:
		var ray_angle = i * 2 * PI / 8
		ray_direction[i] = Vector2.RIGHT.rotated(ray_angle)

func updateDirection():
	direction = Vector2.ZERO
	var direct_space_state = get_world_2d().direct_space_state
	var dir = 0
	# 如果有碰撞，则从8个方向中寻找一个没有发生碰撞并且不是相反的方向继续移动
	for i in 8:
		# 只取目标方向60度角以内的方向
		var dotValue = ray_direction[i].dot((player_nav.get_next_path_position() - player.position).normalized())
		print(dotValue)
		if (dir > dotValue):
			continue
		else :
			dir = dotValue
		if dotValue < 0:
			continue
		# 判断ray是否碰撞到碰撞体，取第一个没有发生碰撞的方向射线
		var direction_params = PhysicsRayQueryParameters2D.create(player.position, player.position + ray_direction[i] * scope)
		if (direct_space_state.intersect_ray(direction_params).is_empty()):
			direction += ray_direction[i] * dotValue
	direction = direction.normalized()
	last_position = player.position

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
	updateDirection()
	player.velocity = player.velocity.move_toward(direction * speed, 10)
	player.move_and_slide()
