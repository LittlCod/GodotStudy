extends Area2D

# 死亡信号
signal death

const moveUtile = preload("res://Utils/move.gd")
var screenSize
var canHit = false
@onready var spr: AnimatedSprite2D = $spr

func _ready() -> void:
	screenSize = get_viewport_rect().size

func change_active():
	if Input.is_action_pressed("ui_left"):
		spr.animation = "walk"
		spr.flip_h = true
	if Input.is_action_pressed("ui_up"):
		spr.animation = "up"
		spr.flip_v = false
	if Input.is_action_pressed("ui_down"):
		spr.animation = "up"
		spr.flip_v = true
	if Input.is_action_pressed("ui_right"):
		spr.animation = "walk"
		spr.flip_h = false

func _process(delta: float) -> void:
	if $"../..".startGame:
		var moveData = moveUtile.move(delta, 500)
		if moveData != null:
			change_active()
			position += moveData
			position = position.clamp(Vector2.ZERO, screenSize)

func _on_body_entered(body: Node2D) -> void:
	if body.editor_description != "enemy" || !canHit:
		return
	death.emit()
