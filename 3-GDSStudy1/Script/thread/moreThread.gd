extends Node

func _ready():
	self.connect("pressed", Callable(self, "_onButton"))

func _onButton():
	var myThread = Thread.new()
	myThread.start(_textThread.bind('这', '是'))
	var wait = await myThread.wait_to_finish()
	print(wait)
	
func _textThread(a, b):
	print(a, b, 'thread')
	await get_tree().create_timer(5).timeout
	return b+a

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
