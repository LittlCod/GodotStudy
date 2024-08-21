extends Node

# 生命周期函数
func _init():
	print("孙节点init")
	
func _enter_tree():
	print("孙节点enter_tree")
	
func _ready():
	print("孙节点ready")
	
func _exit_tree():
	print("孙节点exit_tree")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
