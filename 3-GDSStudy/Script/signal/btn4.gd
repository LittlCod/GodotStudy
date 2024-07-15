extends Node

#自定义信号
signal mySignal(a, b)

func _ready():
	self.connect("pressed", Callable(self, "handleMySignal"))
	
func handleMySignal():
	print(123)
	emit_signal("mySignal", '参数1', '参数2耶耶耶')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
