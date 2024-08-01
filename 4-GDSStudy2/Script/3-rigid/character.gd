extends CharacterBody2D

# 定义速度变量和屏幕大小的变量
@export var speed = 50
var screen_size
var player_size
# tilemap的数据
@onready var tile_map = $"../TileMap"

func _ready():
	# 获取屏幕和精灵的长宽
	screen_size = get_viewport_rect().size
	# player_size = self.get_rect().size

func enter_event():
	print("进来了~")
	
# move函数
func move(dir):
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
	if Input.is_action_pressed("ui_up"):
		dir.y = -1
	if Input.is_action_pressed("ui_down"):
		dir.y = 1
	if Input.is_action_pressed("ui_right"):
		dir.x = 1
	# 如果向量长度是0，直接返回
	if dir.length() <= 0:
		return
	# 单位向量 * 速度 = 本次朝固定方向移动的速度
	dir = dir.normalized() * speed * get_tile_speed()
	return dir
	
# 获取瓦片速度数据
func get_tile_speed():
	var position = self.position
	var tile = tile_map.local_to_map(position)
	var cell_data = tile_map.get_cell_tile_data(0, tile)
	if cell_data:
		var speed = cell_data.get_custom_data("speed")
		return speed
	else :
		return 10

func _physics_process(delta):
	get_tile_speed()
	# 创建一个向量
	var dir = Vector2.ZERO
	# 算出move的向量
	dir = move(dir)
	if dir:
		# dir是方向速度，delta是每帧的间隔时间  速度*时间=距离
		# position += dir * delta
		# position.x = clamp(position.x, 0, screen_size.x - player_size.x)
		# position.y = clamp(position.y, 0, screen_size.y - player_size.y)
		# position.x = clamp(position.x, 0, screen_size.x)
		# position.y = clamp(position.y, 0, screen_size.y)
		# 用这个方法实现移动和碰撞
		var info: KinematicCollision2D = move_and_collide(dir * delta, false)
