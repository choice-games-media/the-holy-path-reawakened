extends Area2D

@onready var game_manager: Node2D = get_tree().current_scene


func _on_body_entered(_body: Node2D) -> void:
	game_manager.unlock_door()
	queue_free()
