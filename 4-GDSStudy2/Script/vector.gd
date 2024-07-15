extends Node

func _ready():
	var va = Vector2(3, 4)
	var vb = Vector2(1, 2)
	print("va:", va) # (3, 4)
	print("vb:", vb) # (1, 2)
	# 向量长度
	print("va:", va, "长度:", va.length()) # 5
	print("vb:", vb, "长度:", vb.length()) # 5
	# 单位向量（当前方向上长度为1的向量）
	print("va的单位向量:", va.normalized(), "长度:", va.normalized().length())
	# 向量加减法,va-vb可以表示b指向a的方向
	print("va+vb=", va + vb) # (4, 6)
	print("va-vb=", va - vb) # (2 ,2)
	# 向量乘法
	print("va*2=", va * 2) # (6, 8)
	print(va.dot(vb)) # 点积 11
	print(va.cross(vb)) # 叉积 2
	# 向量夹角
	print("va与vb的夹角:", va.angle_to(vb))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
