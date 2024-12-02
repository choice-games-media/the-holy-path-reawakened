extends Node2D

var keys: int = 0


func unlock_door():
	keys += 1
	get_tree().current_scene.get_node("World/Door%s/CollisionShape2D" % keys).queue_free()
