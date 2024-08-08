extends Sprite2D


# 定时器回调函数
func on_time_out():
	if frame < 5:
		frame += 1
	else:
		frame = 0

func _ready():
	# 连接Timer的timeout信号
	$Timer.connect("timeout", on_time_out)
