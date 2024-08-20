extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var player_spr: AnimatedSprite2D = $PlayerSpr


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		player_spr.animation = "run"
		velocity.x = direction * SPEED
		if direction > 0:
			player_spr.flip_h = false
		else:
			player_spr.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		player_spr.animation = "idle"

	move_and_slide()
