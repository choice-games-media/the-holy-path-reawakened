extends AudioStreamPlayer2D

const MENU_MUSIC = preload("res://assets/music/Kevin MacLeod - Galactic Rap.mp3")
const GAME_MUSIC = preload("res://assets/music/Elektronomia - Sky High.mp3")
var scene_playing_music: String


func update_music(scene_name: String):
	if scene_playing_music != scene_name:
		scene_playing_music = scene_name
		self.stop()
		match scene_name:
			"Menu":
				self.set_stream(MENU_MUSIC)
				self.set_volume_db(0)

			"Game":
				self.set_stream(GAME_MUSIC)
				self.set_volume_db(-15)
		self.play()
