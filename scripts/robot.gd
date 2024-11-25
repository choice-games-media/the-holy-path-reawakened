extends Node2D

const SPEED: int = 50
var direction: int = 1  # Positive values = right, negative values = left
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		direction = 1
		sprite.flip_h = false
	if ray_cast_right.is_colliding():
		direction = -1
		sprite.flip_h = true

	position.x += direction * SPEED * delta
