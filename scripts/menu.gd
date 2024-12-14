extends Control

@onready var hover_sfx: AudioStreamPlayer2D = $HoverSfx
@onready var select_sfx: AudioStreamPlayer2D = $SelectSfx


func _ready() -> void:
	DisplayServer.window_set_min_size(Vector2i(1152, 648))
	MusicPlayer.update_music("Menu")


func _on_play_button_pressed() -> void:
	await _button_effects()
	MusicPlayer.update_music("Game")
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_options_button_pressed() -> void:
	await _button_effects()
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_credits_button_pressed() -> void:
	await _button_effects()
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_exit_button_pressed() -> void:
	await _button_effects()
	get_tree().quit()


func _on_button_mouse_entered() -> void:
	hover_sfx.play()


func _button_effects() -> void:
	select_sfx.play()

	# https://forum.godotengine.org/t/is-there-a-wait-function-to-godot/38759
	await get_tree().create_timer(0.3).timeout
