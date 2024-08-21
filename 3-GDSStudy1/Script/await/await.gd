extends Node


# await 节点.信号  示等待直到收到节点的信号后才会继续执行
func _ready():
	print("启动了！")
	await $Button.pressed
	print("按钮被按了！")
	await get_tree().create_timer(2).timeout
	print("按钮被按完两秒了！")
	await $Button.mySignal
	await await_test()
	print("await一个函数")
	
func await_test():
	var a = await $Button.mySignal
	print("按钮的自定义信号被触发了！")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
