extends Node2D

# 使用AStar寻路
@onready var astarNode: AStar2D = AStar2D.new()
@onready var layer: TileMapLayer = $Layer0

var mapSize: Vector2i

func _ready():
	# 遍历所有层，将可以寻路的tile加入AStar图的节点中
	#for layer in range(get_layers_count()):
	var cells = layer.get_used_cells()
	for cell in cells:
		var tileData = layer.get_cell_tile_data(cell)
		var nav = tileData.get_navigation_polygon(0)
		if nav == null:
			continue
		var pointIndex = calculate_point_index(cell)
		astarNode.add_point(pointIndex, Vector2(cell.x, cell.y))
	# 移除有碰撞的节点
	#for layer in range(get_layers_count()):
		#var cells = layer
	for cell in cells:
		var tileData = layer.get_cell_tile_data(cell)
		var collision = tileData.get_collision_polygons_count(0)
		if collision <= 0:
			continue
		var pointIndex = calculate_point_index(cell)
		if astarNode.has_point(pointIndex):
			astarNode.remove_point(pointIndex)

	# 连接图的节点
	for id in astarNode.get_point_ids():
		var cellPosition = Vector2i(astarNode.get_point_position(id))
		var relativeCells: Array[Vector2i] = [
			cellPosition + Vector2i.RIGHT,
			cellPosition + Vector2i.LEFT,
			cellPosition + Vector2i.DOWN,
			cellPosition + Vector2i.UP,
		]
		for relativeCell in relativeCells:
			var relativeCellIndex = calculate_point_index(relativeCell)
			if is_outside_map_bounds(relativeCell):
				continue
			if astarNode.has_point(relativeCellIndex):
				astarNode.connect_points(id, relativeCellIndex, false)

func calculate_point_index(point: Vector2i) -> int:
	mapSize = layer.get_used_rect().size
	return point.x + point.y * mapSize.x

func is_outside_map_bounds(point: Vector2i) -> bool:
	mapSize = layer.get_used_rect().size
	return point.x < 0 || point.y < 0 || point.x >= mapSize.x || point.y >= mapSize.y

func get_nav_path(startCellPosition: Vector2i, endCellPosition: Vector2i) -> PackedVector2Array:
	var navCellPath = astarNode.get_point_path(calculate_point_index(startCellPosition), calculate_point_index(endCellPosition))
	var localPath = PackedVector2Array()
	for cellPosition in navCellPath:
		localPath.push_back(layer.map_to_local(Vector2i(cellPosition)))
	return localPath
