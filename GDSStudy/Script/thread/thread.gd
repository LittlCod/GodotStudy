extends Node

func _ready():
	self.connect("pressed", Callable(self, ""))

func _onButton():
	var myThread = Thread.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
