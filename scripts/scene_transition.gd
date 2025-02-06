extends ColorRect

@onready var animation_player = $AnimationPlayer


func play(animation_name: String) -> void:
	animation_player.play(animation_name)
