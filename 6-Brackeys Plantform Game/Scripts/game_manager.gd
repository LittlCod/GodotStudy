extends Node

var point : int = 0
@onready var score: Label = $Score

func add_score():
	point += 1
	score.text = "You have " + str(point) + " coins!"
