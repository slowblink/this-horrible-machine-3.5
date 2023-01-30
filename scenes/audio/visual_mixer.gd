extends Control

func _ready():
	OS.center_window()
	Global.Playing = true
	#Pause.pauseGame()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
