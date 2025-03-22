extends Control

@onready var music_spin_box: SpinBox = $MarginContainer/VBoxContainer/GridContainer/MusicSpinBox
@onready var music_slider: Slider = $MarginContainer/VBoxContainer/GridContainer/MusicSlider
@onready var sfx_spin_box: SpinBox = $MarginContainer/VBoxContainer/GridContainer/SfxSpinBox
@onready var sfx_slider: Slider = $MarginContainer/VBoxContainer/GridContainer/SfxSlider
@onready var sample_sfx: AudioStreamPlayer2D = $SampleSfx


func _ready() -> void:
	music_spin_box.set_value(AudioServer.get_bus_volume_db(1))
	music_slider.set_value(AudioServer.get_bus_volume_db(1))
	sfx_spin_box.set_value(AudioServer.get_bus_volume_db(2))
	sfx_slider.set_value(AudioServer.get_bus_volume_db(2))
	SceneTransition.play("fade_from_black")


func _on_music_spin_box_value_changed(value: float) -> void:
	music_slider.set_value(value)
	AudioServer.set_bus_volume_db(1, value)


func _on_music_slider_value_changed(value: float) -> void:
	music_spin_box.set_value(value)
	AudioServer.set_bus_volume_db(1, value)


func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_sfx_spin_box_value_changed(value: float) -> void:
	sfx_slider.set_value(value)
	AudioServer.set_bus_volume_db(2, value)


func _on_sfx_slider_value_changed(value: float) -> void:
	sfx_spin_box.set_value(value)
	AudioServer.set_bus_volume_db(2, value)
	sample_sfx.play()


func _on_full_screen_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
