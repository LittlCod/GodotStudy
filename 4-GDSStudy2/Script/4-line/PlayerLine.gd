extends Line2D

func add_point_fn(x, y):
	add_point(Vector2(x, y))
	
func add_player_line():
	var player = get_parent().find_child("Player")
	var player_x = player.get_position().x
	var player_y = player.get_position().y
	add_point_fn(player_x, player_y)
	if (get_point_count() > 20):
		remove_point(0)
	
func _ready():
	self.width = 50

func _process(delta):
	add_player_line()
