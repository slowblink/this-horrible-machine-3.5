tool
extends StateAnimation


var tween
export (int) var ground_jump_speed = 250


# FUNCTIONS AVAILABLE TO INHERIT

func _on_enter(_args) -> void:
	# Commented because it is defined in the inspector as "Anim_on_enter"
	# play("Jump")

	# This tween is to have the jump preparation appear still on ground
	# tweek the values according to your sprite size, and jump speed
	var anim_player = get_node_or_null(animation_player)
	if anim_player:
		var anim_length = anim_player.current_animation_length
		tween = get_tree().create_tween()
		tween.tween_property(target.skin, "position:y", 14.0, anim_length)


func jump():
	target.velocity.y = - ground_jump_speed

	var anim_player = get_node_or_null(animation_player)
	if anim_player and anim_player.current_animation_position >= 0.1:
		target.skin.rotation = - target.velocity.angle_to(Vector2.UP)
		target.skin.position = Vector2()


func _on_exit(_args) -> void:
	tween.stop()

