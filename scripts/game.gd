extends Node2D

var keys: int = 0
var coins: int = 0
var scene_transition: ColorRect = SceneTransition
@onready var coins_label: Label = $HUD/MarginContainer/Coins
@onready var victory_label: Label = $HUD/MarginContainer/Victory


func _ready() -> void:
	var current_scene = get_tree().get_current_scene().get_name()
	if not Global.has_played_transition[current_scene]:
		scene_transition.play("fade_from_black")
		scene_transition.reparent($HUD)
		Global.has_played_transition[current_scene] = true


func unlock_door():
	keys += 1
	get_tree().get_current_scene().get_node("World/Door" + str(keys)).queue_free()


func add_coin():
	coins += 1
	coins_label.set_text("Coins: " + str(coins))


func win_game():
	victory_label.show()
