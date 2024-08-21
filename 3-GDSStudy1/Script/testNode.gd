extends Node2D

# 通过脚本控制节点
# Called when the node enters the scene tree for the first time.
func _ready():
	# 通过脚本添加节点
	var sprite = Sprite2D.new(); # new一个Sprite2D节点
	
	# 设置精灵节点的图片
	var icon = preload("res://icon.svg");
	sprite.texture = icon;
	
	# 设置节点名称
	sprite.name = "testNodeChild";
	
	# 更改节点位置
	sprite.position.x = 200;
	sprite.position.y = 200;
	
	# 将Sprite2D节点添加到子节点中
	add_child(sprite); 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# 使节点旋转
	var sprite = $testNodeChild;
	sprite.rotate(0.1);
