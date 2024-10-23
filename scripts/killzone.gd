extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(body:Node2D) -> void:
	print("Player died!")
	# This also moves the camera, since it is a child of the player
	#body.queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
