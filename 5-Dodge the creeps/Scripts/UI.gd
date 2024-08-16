extends Control

signal start_game
@onready var score_timer: Timer = $TopContainer/ScoreTimer

func _ready() -> void:
	$BottomContainer/Button.connect("pressed", _on_startButton_pressed)
	score_timer.connect("timeout", add_score)

# 点击开始按钮发送信号
func _on_startButton_pressed() -> void:
	start_game.emit()
	
# 分数增加
func add_score():
	var score = $TopContainer/Label.text.to_int()
	$TopContainer/Label.text = String.num(score + 1)

# 开始游戏的前置操作
func get_ready():
	$BottomContainer.hide()
	$TopContainer/Label.text = "0"
	await get_tree().create_timer(1.0).timeout
	change_text("start")
	await get_tree().create_timer(0.5).timeout
	change_text("hidden")
	score_timer.start()
	
func get_end_game():
	$MiddleContainer.show()
	score_timer.stop()
	await get_tree().create_timer(2.0).timeout
	change_text("init")
	$BottomContainer.show()

func change_text(type):
	match type:
		"init":
			$MiddleContainer/Label.text = "Dodge the\nCreeps"
		"ready":
			$MiddleContainer/Label.text = "Ready..."
			get_ready()
		"start":
			$MiddleContainer/Label.text = "Go!"
		"end":
			get_end_game()
			$MiddleContainer/Label.text = "Game Over"
		"hidden":
			$MiddleContainer.hide()
