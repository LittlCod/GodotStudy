extends Node2D

var blood := 50:
	# 当变量值发生变化的时候执行set函数，类似vue的watch
	set(value):
		blood = clamp(value, 0, 100)
var blood_half : int:
	# 获取get中的变量值的变化并经过处理后返回自身，类似vue的computed
	get:
		return blood / 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in 13:
		blood += i
		print(i, '-', blood)
		print("blood_half:", blood_half)
