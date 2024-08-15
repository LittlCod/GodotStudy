extends Node2D

func _ready():
	$"Save".connect("pressed", save)
	$"Load".connect("pressed", load)

func save():
	var save_dict = create_dict()
	# 文件夹不存在返回null
	var save_file = FileAccess.open("res://testSave/save.txt", FileAccess.WRITE)
	if save_file == null:
		var dir = DirAccess.open("res://")
		dir.make_dir_recursive("testSave")
		save()
		return
	save_file.store_string(JSON.stringify((save_dict)))

func create_dict():
	var save_dict = {}
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		if node == $"player":
			var player_x = node.position.x
			var player_y = node.position.y
			save_dict["player_x"] = player_x
			save_dict["player_y"] = player_y
	return save_dict

func load():
	var load_file = FileAccess.open("res://testSave/save.txt", FileAccess.READ)
	if load_file == null:
		return
	var load_dict = JSON.parse_string(load_file.get_as_text())
	var player_x = load_dict["player_x"]
	var player_y = load_dict["player_y"]
	var player = $"player"
	player.position = Vector2(player_x, player_y)