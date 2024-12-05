extends Node2D

var keys: int = 0
var coins: int = 0
@onready
var coins_label: Label = get_tree().get_current_scene().get_node("HUD/MarginContainer/Coins")


func unlock_door():
	keys += 1
	get_tree().get_current_scene().get_node("World/Door%s/CollisionShape2D" % keys).queue_free()


func add_coin():
	coins += 1
	coins_label.set_text("Coins: " + str(coins))
