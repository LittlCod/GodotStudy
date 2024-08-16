extends CharacterBody2D

@onready var enemy_spr: AnimatedSprite2D = $EnemySpr
@export var speed : int

func _ready() -> void:
	var animeArr = Array(enemy_spr.sprite_frames.get_animation_names())
	enemy_spr.animation = animeArr.pick_random()
	speed = 200 * randf() + 100
	await get_tree().create_timer(10).timeout
	queue_free()

# move函数
func handle_move(dir, speed):
	var hspeed = cos(rotation) # 水平速度倍数
	var vspeed = sin(rotation) # 垂直速度倍数
	dir.x *= hspeed
	dir.y *= vspeed
	# 如果向量长度是0，直接返回
	if dir.length() <= 0:
		return
	# 单位向量 * 速度 = 本次朝固定方向移动的速度
	dir = dir.normalized() * speed
	return dir

func move(delta, speed):
	# 创建一个向量
	var dir = Vector2.ONE
	# 算出move的向量
	dir = handle_move(dir, speed)
	if dir:
		# dir是速度，delta是每帧的间隔时间  速度*时间=距离
		return dir * delta

func _process(delta: float) -> void:
	var moveData = move(delta, speed)
	position += moveData


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
