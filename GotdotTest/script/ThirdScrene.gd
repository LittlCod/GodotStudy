extends Node


# 脚本初始化会首先调用这个方法，会在_process()方法之前调用
func _ready():
	# get_tree().paused = true
	pass

var count = 0
# 每一帧都会调用这个方法
func _process(delta):
	count = count + 1
	
	if (count % 60 == 0):
		print("parent node")
	if (count % 300 == 0):
		get_tree().paused = true;
	pass
