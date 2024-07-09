extends Node

# 用btn6统一分配信号

# Called when the node enters the scene tree for the first time.
func _ready():
	# 绑定给Button的pressed信号，触发自身的_on_button1_pressed方法
	$"../Button".connect("pressed", Callable(self, "_on_button1_pressed"))
	# 绑定给Button3的pressed信号，触发Button2的_on_click_Btn2方法
	$"../Button3".connect("pressed", Callable($"../Button2", "_on_click_Btn2"))
 	# 绑定给Button4的mySignal信号，触发自身的_on_button4_pressed方法
	$"../Button4".connect("mySignal", Callable(self, "_on_button4_pressed"))

func _on_button1_pressed():
	print("button1 被点击了")
	
func _on_button4_pressed(a, b):
	print("button4 被点击了", a, b)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

