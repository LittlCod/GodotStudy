@icon("res://../Image/icon.svg")

extends Node2D

class_name MyNode

func _ready():
	print("my custom node")
	pass

@export var a: int = 1
@export var b: String
