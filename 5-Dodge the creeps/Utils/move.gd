extends CharacterBody2D

# move函数
static func handle_move(dir, speed):
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
	dir = dir.normalized() * speed
	return dir

static func move(delta, speed):
	# 创建一个向量
	var dir = Vector2.ZERO
	# 算出move的向量
	dir = handle_move(dir, speed)
	if dir:
		# dir是速度，delta是每帧的间隔时间  速度*时间=距离
		return dir * delta
