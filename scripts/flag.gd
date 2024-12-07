extends Area2D

@onready
var victory_label: Label = get_tree().get_current_scene().get_node("HUD/MarginContainer/Victory")
@onready var win_sound: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_body_entered(body: Node2D) -> void:
	victory_label.show()
	body.get_node("Camera2D").reparent(self)
	body.frozen = true
	win_sound.play()
