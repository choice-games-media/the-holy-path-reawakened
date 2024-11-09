extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -(SPEED * 2)
var dead = false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if not dead:
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			sprite.play("jump")
			velocity.y = JUMP_VELOCITY

		# Get the input direction. Returns: -1, 0, 1
		var direction := Input.get_axis("move_left", "move_right")

		# Flips the sprite according to the player's direction.
		# The player's sprite starts facing right.
		if direction > 0:  # Moving right
			sprite.flip_h = false
		elif direction < 0:  # Moving left
			sprite.flip_h = true

		# Plays sprite animations.
		if is_on_floor():  # Stationary
			if direction == 0:  # Stationary
				sprite.play("idle")
			else:
				sprite.play("walk")
		else:  # Airborne
			sprite.play("jump")

		# Handle the movement/deceleration.
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
