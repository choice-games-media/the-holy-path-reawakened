extends Area2D

@onready var game_manager: Node2D = get_tree().get_current_scene()
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(_body: Node2D) -> void:
	game_manager.unlock_door()
	animation_player.play("pickup")
