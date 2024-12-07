extends Area2D

@onready var timer: Timer = $Timer
@onready var killed_sound: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_body_entered(body: Node2D) -> void:
	if body.dead == false:  # To prevent the player from dying multiple times and resetting the timer
		body.get_node("AnimatedSprite2D").play("die")
		killed_sound.play()
		body.dead = true
		timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
