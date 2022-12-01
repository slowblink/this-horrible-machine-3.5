tool
extends StateAnimation


var tween
export (int) var wall_jump_speed = 250


# FUNCTIONS AVAILABLE TO INHERIT

func _on_enter(_args) -> void:
	# This tween is to have the jump preparation appear still on wall
	# tweek the values according to your sprite size, and jump speed
	var anim_player = get_node_or_null(animation_player)
	if anim_player:
		var anim_length = anim_player.current_animation_length
		tween = get_tree().create_tween()
		tween.tween_property(target.skin, "position:y", 10.0, anim_length)
		tween.parallel().tween_property(target.skin, "position:x", target.wall_dir * 10.0, anim_length)

	target.skin.rotation = - target.wall_dir * PI/2

	# var _t = get_parent().add_timer("JumpTimer", target.jump_time)


func jump():
	target.velocity = Vector2(- target.wall_dir * wall_jump_speed, - wall_jump_speed)
	target.velocity = target.velocity.normalized() * wall_jump_speed
	
	var anim_player = get_node_or_null(animation_player)
	if anim_player and anim_player.current_animation_position >= 0.1:
		target.skin.rotation = - target.velocity.angle_to(Vector2.UP)
		target.skin.position = Vector2()


func _on_exit(_args) -> void:
	tween.stop()
	target.skin.rotation = 0
