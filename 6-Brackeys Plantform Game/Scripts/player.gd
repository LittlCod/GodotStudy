extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var blood = 5
@onready var player_spr: AnimatedSprite2D = $PlayerSpr
@onready var blood_bar: TextureProgressBar = $BloodBar
var lockAnimation = false

func _ready() -> void:
	blood_bar.max_value = blood
	blood_bar.value = blood

func death_fn():
	$Death.play()
	blood_bar.value = 0
	player_spr.animation = "death"
	lockAnimation = true
	Engine.time_scale = 0.5
	await get_tree().create_timer(1).timeout
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	
func hit_fn(bloodHit):
	blood -= bloodHit
	blood_bar.value = blood
	# 血量归零直接死亡
	if blood <= 0:
		death_fn()
		return
	# 播放受伤动画
	$Hurt.play()
	player_spr.animation = "hit"
	lockAnimation = true
	await player_spr.animation_finished
	lockAnimation = false
	player_spr.play()

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# 受伤和死亡动画时不能操作
	if lockAnimation:
		return
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$Jump.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# 切换动画
	if direction > 0:
		player_spr.flip_h = false
	elif direction < 0:
		player_spr.flip_h = true
	if is_on_floor():
		if direction == 0:
			player_spr.animation = "idle"
		else:
			player_spr.animation = "run"
	else:
		player_spr.animation = "jump"
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
