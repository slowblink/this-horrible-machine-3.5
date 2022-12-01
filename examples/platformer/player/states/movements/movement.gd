tool
extends State


export (int) var gravity = 2500

# FUNCTIONS TO INHERIT #

func _on_update(delta):
	target.dir = 0

	if Input.is_action_pressed("left"):
		target.dir = -1
	elif Input.is_action_pressed("right"):
		target.dir = 1

	target.velocity.y += delta * gravity


func _after_update(_delta):
	target.velocity = target.move_and_slide(target.velocity, Vector2.UP)

	if target.velocity.x > 0:
		target.skin.scale.x = 1
	elif target.velocity.x < 0:
		target.skin.scale.x = -1
