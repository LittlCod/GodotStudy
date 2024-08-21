extends Node

# @export 导出的变量，会反映在编辑器中，可以直接编辑
@export var n = 1; # 导出一个普通变量
@export var np: Node; # 导出一个节点
@export_file var file; # 导出文件路径
@export_file("*.svg") var file2; # 指定文件后缀
@export var file3: Resource; # 导出资源文件路径
@export_color_no_alpha var color; # 导出颜色

func _init():
	print("initChild");

# Called when the node enters the scene tree for the first time.
func _ready():
	# range(20) 相当于 for(var i = 1; i < 20; i++)
	for i in range(5):
		print("for测试1： ", i);
	print(n); # 通过缩进来判断是否在作用域内
	# range(5, 10) 相当于 for(var i = 5; i < 10; i++)
	for i in range(5, 10):
		print("for测试2： ", i);
	# range(10, 20, 3) 相当于 for(var i = 10; i < 20; i+=3)
	for i in range(10, 20, 3):
		print("for测试3： ", i);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
