extends Node2D

var whiteColor: Color = Color(1, 1, 1, 1)

# 画圆
var circleRadius: float = 20

# 画折线
var array: Array = [Vector2(200, 300), Vector2(300, 400), Vector2(300, 400), Vector2(400, 300)]
var multiLine: PackedVector2Array = PackedVector2Array(array)

# 画方形
var rect: Rect2 = Rect2(200.0, 300.0, 200.0, 200.0)

# 画三角形
var pointArray: PackedVector2Array = PackedVector2Array([Vector2(700,100),Vector2(800,150),Vector2(900,100)])
var colorArray: PackedColorArray = PackedColorArray([Color(1,0,0,1),Color(0,1,0,1),Color(0,0,1,1)])

# 画字符串
var dynamic_font = preload("res://Font/BarlowCondensed-Bold.ttf")

var texture: Texture = null

func _ready():
	texture = load("res://icon.svg")

var count = 0

func _draw() -> void:
	print("start draw")
	draw_circle(Vector2(100, 100), circleRadius, whiteColor)
	draw_line(Vector2(50, 50), Vector2(200, 200), whiteColor)
	draw_multiline(multiLine, whiteColor)
	draw_rect(rect, whiteColor, false)
	draw_primitive(pointArray, colorArray, pointArray)
	draw_string(dynamic_font, Vector2(200, 100), "Hello World", 40)
	if count >= 900:
		draw_texture(texture, Vector2(400, 400))

func _process(delta):
	count += 1
	if count == 900:
		# 想要重新绘制必须调用这个方法，直接调用_draw()是没用的
		queue_redraw()
