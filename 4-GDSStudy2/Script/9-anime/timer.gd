extends Sprite2D

# 使用计时器实现动画效果
var back = 1

# 定时器回调函数
func on_time_out():
	if frame < 5:
		frame += 1
	else:
		frame = 0	
	# 来回跑
	if position.x >= 100 && position.x <= 300:
		position.x += 10 * back
	elif position.x > 300:
		back = -1
		flip_h = true
		position.x = 300
	else:
		back = 1
		flip_h = false
		position.x = 100

func _ready():
	position.x = 100
	# 连接Timer的timeout信号
	$Timer.connect("timeout", on_time_out)
