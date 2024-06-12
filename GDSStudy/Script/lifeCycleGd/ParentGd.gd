extends Node

# 生命周期函数
# 初始化
func _init():
	print("父节点init")

# 挂载到场景树
func _enter_tree():
	print("父节点enter_tree")

# 
func _ready():
	print("父节点ready")
	$Button.connect("pressed", Callable(self, "deleteSubNode1"))

# 移出场景树
func _exit_tree():
	print("父节点exit_tree")
	
func deleteSubNode1():
	var root = get_tree().root
	root.remove_child(self)
	
	# 删除的节点需要手动释放内存
	self.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
