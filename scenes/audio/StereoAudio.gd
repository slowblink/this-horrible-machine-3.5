extends Spatial

onready var left  = $AudioStreamPlayerLeft
onready var right = $AudioStreamPlayerRight

export var volume = 0.0 					setget set_volume
export var playing = false					setget set_playing
export var paused  = false					setget set_paused
export var bus_target_left  = "Master"		setget set_bus_target_left
export var bus_target_right = "Master"		setget set_bus_target_right

export var pan = 0.0

func _ready():
	pass

func set_pan(value):
	value += 1.0
	value *= 0.5
	left.volume_db  = lerp(-80.0, left.volume_db,  min(     value  * 2.0, 1.0))
	right.volume_db = lerp(-80.0, right.volume_db, min((1.0-value) * 2.0, 1.0))

func set_volume(value):
	left.volume_db  = value
	right.volume_db = value
	set_pan(pan)
	
func set_playing(value):
	left.playing  = value
	right.playing = value
	right.playing = value

func set_paused(value):
	left.stream_paused  = value
	right.stream_paused = value

func set_bus_target_left(value):
	left.bus = value

func set_bus_target_right(value):
	right.bus = value
	
