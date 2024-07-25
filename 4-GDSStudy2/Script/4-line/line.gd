extends Line2D

func add_point_fn(x, y):
	add_point(Vector2(x*200, y*200))

func _ready():
	# 画一个狗
	add_point_fn(0, 0)
	add_point_fn(0, 1)
	add_point_fn(1, 1)
	add_point_fn(1, 0)
	add_point_fn(0, 0)

	add_point_fn(0.5, 0.5)
	add_point_fn(0.5, 0.75)
	add_point_fn(0.75, 0.75)
	add_point_fn(0.75, 0.5)
	add_point_fn(0.5, 0.5)

	add_point_fn(0.25, 0.25)
	add_point_fn(0.25, 0.5)
	add_point_fn(0.5, 0.5)
	add_point_fn(0.5, 0.25)
	add_point_fn(0.25, 0.25)

	add_point_fn(0.75, 0.25)
	add_point_fn(0.75, 0.5)
	add_point_fn(0.5, 0.5)
	add_point_fn(0.5, 0.25)
	add_point_fn(0.75, 0.25)

func _process(delta):
	pass
