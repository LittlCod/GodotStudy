extends Node

signal mySignal(a,b)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect('pressed', Callable(self, "handleMySignal"))

func handleMySignal():
	print("按钮里的print!")
	emit_signal("mySignal", 114, 514)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
