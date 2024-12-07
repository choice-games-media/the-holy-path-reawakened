extends CharacterBody2D

const SPEED: float = 150.0
const JUMP_VELOCITY: float = -(SPEED * 2)
var direction: float
var dead: bool = false
var frozen: bool = false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if not dead:
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor() and not frozen:
			sprite.play("jump")
			jump_sound.play()
			velocity.y = JUMP_VELOCITY

		# Get the input direction. Returns: -1, 0, 1
		if not frozen:
			direction = Input.get_axis("move_left", "move_right")
		else:
			direction = 0

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
