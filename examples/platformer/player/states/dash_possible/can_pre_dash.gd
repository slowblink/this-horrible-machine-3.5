tool
extends State


signal pre_dashed


func _on_update(_delta) -> void:
	if Input.is_action_just_pressed("dash"):
		emit_signal("pre_dashed")
