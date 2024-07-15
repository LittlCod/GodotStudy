extends Node

func _ready():
	self.connect("pressed", Callable(self, "_onButton"))

func _onButton():
	var myThread = Thread.new()
	myThread.start(_textThread.bind('这', '是'))
	print('线程id：', myThread.get_id())
	print('线程活跃：', myThread.is_alive())
	
	var waitForThread = myThread.wait_to_finish()
	
	print('线程结果：', waitForThread)
	print('结束线程id：', myThread.get_id())
	print('结束线程活跃：', myThread.is_alive())
	
func _textThread(a, b):
	print(a, b, 'thread')
	return b+a

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
