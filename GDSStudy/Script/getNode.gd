extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	# $的用法和获取文件路径的方法一模一样
	# 获取当前节点的方法
	var currentNode = $"."
	print(currentNode)
	var currentNode2 = self
	print(self)
	
	# 获取父节点
	var parentNode = get_parent()
	print(parentNode)
	var parentNode2 = $".."
	print(parentNode2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
