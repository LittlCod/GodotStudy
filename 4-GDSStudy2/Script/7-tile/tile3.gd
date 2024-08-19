# 寻路3
extends Node2D

@onready var player = $Player
@onready var line_2d = $Line2D
@onready var player_nav = $Player/PlayerNav
@onready var tile_map = $TileMap

const SPEED = 40
var path : = PackedVector2Array()

# 获取瓦片速度数据
func get_tile_speed() -> int:
	var tilePosition = player.position
	var tile = tile_map.layer.local_to_map(tilePosition)
	var cell_data = tile_map.layer.get_cell_tile_data(tile)
	if cell_data:
		return cell_data.get_custom_data("speed")
	else:
		return 10

func move_alone_path(distance: float) -> void:
	for index in range(path.size()):
		var distance_to_next = player.position.distance_to(path[0])
		player.velocity = (path[0] - player.position).normalized() * (SPEED * get_tile_speed())
		if distance <= distance_to_next:
			break

		path.remove_at(0)

func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	var playerPosition = player.global_position
	var mousePosition = event.global_position
	var startCellPosition = tile_map.layer.local_to_map(playerPosition)
	var endCellPosition = tile_map.layer.local_to_map(mousePosition)
	var navPath = tile_map.get_nav_path(startCellPosition, endCellPosition)
	line_2d.points = navPath
	path = navPath

# 移除line_2d上player走过的点
func remove_points() -> void:
	if !line_2d.points.is_empty():
		line_2d.clear_points()

func _physics_process(delta):
	if path.is_empty():
		remove_points()
		return
	var moveDistance = SPEED * get_tile_speed() * delta
	move_alone_path(moveDistance)
	player.move_and_slide()
