extends Sprite2D

# 使用Tween实现补间动画

func _ready():
	# .set_parallel(true) 可以让动画并行执行
	var tween = get_tree().create_tween().set_parallel(true)
	tween.set_ease(1) # 设置缓动
	tween.set_loops() # 循环执行，不写次数就是无限
	tween.tween_property(self, "position", Vector2(300, 300), 1)
	tween.chain().tween_property(self, "position", Vector2(89, 235), 1)
	tween.tween_property(self, "modulate", Color.RED, 1)
	tween.chain().tween_property(self, "modulate", Color.WHITE, 1)
	tween.tween_property(self, "scale", Vector2(1.5, 1.5), 1)
	tween.chain().tween_property(self, "scale", Vector2(3, 3), 1)
