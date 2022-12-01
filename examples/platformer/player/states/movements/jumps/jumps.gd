tool
extends State


export (int) var jump_min_height = 16
export (int) var jump_max_height = 48
var entering_y := 0.0

# FUNCTIONS AVAILABLE TO INHERIT

func _on_enter(_args) -> void:
	var _st = change_state("NoJump")
	entering_y = target.position.y
	var jump_sound = target.get_node("Sounds/JumpSound")
	jump_sound.play()
	jump_sound.pitch_scale = 1.0 + ( randf() - 0.5 ) / 3

func _on_update(_delta) -> void:
	get_active_substate().jump()

	if not Input.is_action_pressed("jump"):
		if target.position.y < entering_y - jump_min_height:
			var _st = change_state("Fall")
	elif target.position.y < entering_y - jump_max_height:
		var _st = change_state("Fall")
	elif target.is_on_ceiling():
		var _st = change_state("Fall")


	if target.velocity.x == 0 and target.dir != 0 and not target.is_on_wall():
		target.velocity = target.velocity.rotated(target.dir * PI/2)


func _on_exit(_args) -> void:
	target.skin.position = Vector2()
	

func _on_jump_finished() -> void:
	get_active_substate().play("Fall")
