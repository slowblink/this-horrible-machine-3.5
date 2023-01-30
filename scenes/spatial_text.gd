extends Position3D

onready var player = get_node("%Player")
onready var head = player.get_node("Head")
onready var sprite = get_node("Sprite3D")
onready var animation_player = get_node("AnimationPlayer")

var player_in_range = false
var t = 0.0
var last_known_position = Vector3.ZERO
var current_position = Vector3.ZERO
var target_position = Vector3.ZERO

export var camera_offset = Vector3.ZERO
export var speed_multiplier = 3.0

func _ready():
	animation_player.play("open")

func _on_Area_body_entered(body):
	if body == player:
		player_in_range = true

func _on_Area_body_exited(body):
	if body == player:
		player_in_range = false

func _process(delta):
	if player_in_range:
		t += delta * speed_multiplier
		target_position = to_local(head.get_global_transform_interpolated().origin) + head.transform.basis.rotated(Vector3.UP,player.rotation.y).xform(camera_offset)
		last_known_position = target_position
	else:
		t -= delta * speed_multiplier
		target_position = Vector3.ZERO
	
	t = clamp(t, 0.0, 1.0)
	var smooth_t = smoothstep(0.0, 1.0, t)
	
	if player_in_range:
		current_position = Vector3.ZERO.linear_interpolate(target_position, smooth_t)
	elif t > 0.0:
		current_position = last_known_position.linear_interpolate(target_position, 1.0-smooth_t)
	
	animation_player.seek(smooth_t, true)
	
	sprite.transform.origin = current_position
