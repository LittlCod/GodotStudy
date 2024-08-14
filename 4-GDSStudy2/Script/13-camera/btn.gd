extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".connect("pressed", change_camera.bind("lt"))
	$"../Button_rt".connect("pressed", change_camera.bind("rt"))
	$"../Button_lb".connect("pressed", change_camera.bind("lb"))
	$"../Button_rb".connect("pressed", change_camera.bind("rb"))
	
func change_camera(index):
	match index:
		"lt":
			$"../Camera_lt".enabled = true
			$"../Camera_lt".make_current()
			await get_tree().create_timer(3.0).timeout
			$"../Camera_lt".enabled = false
		"rt":
			$"../Camera_rt".enabled = true
			$"../Camera_rt".make_current()
			await get_tree().create_timer(3.0).timeout
			$"../Camera_rt".enabled = false
		"lb":
			$"../Camera_lb".enabled = true
			$"../Camera_lb".make_current()
			await get_tree().create_timer(3.0).timeout
			$"../Camera_lb".enabled = false
		"rb":
			$"../Camera_rb".enabled = true
			$"../Camera_rb".make_current()
			await get_tree().create_timer(3.0).timeout
			$"../Camera_rb".enabled = false
	
