extends Node

# 生命周期函数
func _init():
	print("子节点init")
	
func _enter_tree():
	print("子节点enter_tree")
	
func _ready():
	print("子节点ready")
	
func _exit_tree():
	print("子节点exit_tree")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
