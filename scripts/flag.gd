extends Area2D

@onready var victory_label: Label = get_tree().current_scene.get_node("HUD/Victory")


func _on_body_entered(body: Node2D) -> void:
	victory_label.show()
	body.get_node("Camera2D").reparent(self)
	body.queue_free()
