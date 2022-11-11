extends Node

# This script always runs first in the game, and the variables are
# universally accesible to any node in the game.

# The player node.
var player
# If the game is running, and when first launched is set to false.
var Playing = false
# The settings node
var Settings
# The pause node
var PauseNode

func _ready():
	SilentWolf.configure({
		"api_key": "CveITQIj6577yyVKuaft77sNG4k6Le7nasS3kF0U",
		"game_id": "thishorriblemachine",
		"game_version": "0.0.2",
		"log_level": 0
	})
