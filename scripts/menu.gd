extends Control


func _ready() -> void:
	MusicPlayer.update_music("Menu")


func _on_play_button_pressed() -> void:
	MusicPlayer.update_music("Game")
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
