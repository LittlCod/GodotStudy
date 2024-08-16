extends Node2D

# 游戏主控制脚本

# 定义全局变量
var startGame : bool = false
var enemy = preload("res://Scene/Enemy.tscn")
@onready var player: Area2D = $MainGame/Player
@onready var add_enemy_timer: Timer = $MainGame/AddEnemyTimer

func _ready() -> void:
	player.set_visible(false)
	# 接收游戏开始的信号
	$UILayer/Ui.connect("start_game", start_game)
	# 游戏失败信号
	$MainGame/Player.connect("death", gameover)
	add_enemy_timer.connect("timeout", spawn_monster)

# 开始游戏	
func start_game() -> void:
	$Background/HouseInAForestLoop.play()
	$UILayer/Ui.change_text("ready")
	await get_tree().create_timer(2).timeout
	startGame = true
	player_show()
	add_enemy_timer.start()

# 玩家显示操作
func player_show() -> void:
	player.set_visible(true)
	player.set_position(Vector2(210, 360))
	player.canHit = true

# 玩家隐藏操作
func player_hide() -> void:
	player.set_visible(false)
	player.canHit = false
	
# 生成怪物
func spawn_monster():
	# 随机生成怪物
	var monster = enemy.instantiate() as CharacterBody2D
	var rotArray = ['top', 'left', 'right', 'bottom']
	match rotArray.pick_random():
		'top':
			monster.rotate(randf() * PI)
			monster.set_position(Vector2(randf() * 480, -50))
		'bottom':
			monster.rotate(randf() * -PI)
			monster.set_position(Vector2(randf() * 480, 770))
		'left':
			monster.rotate(randf() * -PI + PI/2)
			monster.set_position(Vector2(-50, randf() * 720))
		'right':
			monster.rotate(randf() * PI + PI/2)
			monster.set_position(Vector2(530, randf() * 720))
	$MainGame.add_child(monster)

# gameover
func gameover():
	$Background/HouseInAForestLoop.stop()
	$Background/Gameover.play()
	player_hide()
	$UILayer/Ui.change_text("end")
	add_enemy_timer.stop()
