extends Control


func _ready() -> void:
	DisplayServer.window_set_min_size(Vector2i(1152, 648))
	MusicPlayer.update_music("Menu")


func _on_play_button_pressed() -> void:
	MusicPlayer.update_music("Game")
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
