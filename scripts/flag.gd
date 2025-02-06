extends Area2D

@onready var game_manager: Node2D = get_tree().get_current_scene()
@onready var win_sound: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_body_entered(body: Node2D) -> void:
	# body.get_node("Camera2D").reparent(self)
	body.frozen = true
	win_sound.play()
