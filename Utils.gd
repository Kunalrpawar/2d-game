extends Node

const SAVE_PATH = "res://savegame.bin"

func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data : Dictionary = {
		"playerHP": Game.playerHP,
		"Gold": Game.Gold,
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	file.close()

func load_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	
	var jstr = file.get_as_text()
	var data = JSON.parse_string(jstr)
	if data.error == OK:
		var loaded_data = data.result
		Game.playerHP = loaded_data["playerHP"]
		Game.Gold = loaded_data["Gold"]
	file.close()
