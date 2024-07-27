extends Node2D

@onready var tile_map = $TileMap
func _input(event: InputEvent) -> void:
	# 鼠标左键按下
	if(event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
		print("鼠标左键按下")
		get_tile_data()
		
func get_tile_data() -> void:
	var mouse_position = get_global_mouse_position()
	var tile = tile_map.local_to_map(mouse_position)
	var cell_data = tile_map.get_cell_tile_data(0, tile)
	var speed = cell_data.get_custom_data("speed")
	print("speed: ", speed)
