extends Spatial

export var max_loudness = 0
export var min_loudness = -80

onready var audio_node_left = $AudioStreamPlayerLeft
onready var audio_node_right = $AudioStreamPlayerRight
onready var area_node = $Area/CollisionShape

var listener

func _ready():
	return
#	audio_node.play()
#	audio_node.stream_paused = true
#	audio_node.volume_db = min_loudness
#
#func _physics_process(delta):
#	if audio_node.stream_paused:
#		return
#	var distance = self.transform.origin.distance_to(listener.transform.origin)
#	distance /= area_node.shape.radius
#	var loudness = lerp(max_loudness, min_loudness, distance)
#	audio_node.volume_db = loudness
#
#func _on_Area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
#	if body.name == "Player":
#		audio_node.stream_paused = false
#		listener = body
#		print(body)
#
#
#
#func _on_Area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
#	if body.name == "Player":
#		audio_node.stream_paused = true
#		print(body)
