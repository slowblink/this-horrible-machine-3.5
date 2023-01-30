extends AudioStreamPlayer

const BUS_LAYOUT: String = "res://audio/default_bus_layout.tres"
const MASTER_BUS: int = 0

var front
var left
var right
var back
var up
var down

func _ready():
	AudioServer.set_bus_layout(load(BUS_LAYOUT))
	
