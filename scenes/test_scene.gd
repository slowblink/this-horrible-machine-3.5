extends Spatial

func _ready():
	Global.Playing = true
	# and grabs the player node's camera to set as the current camera.
	Global.player.get_node("%Camera").set_current(true)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


	if Input.is_action_just_pressed("click"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
