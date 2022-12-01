extends KinematicBody2D


# Please, don't re-use this code, it is just a joke!

export var speed := Vector2(60,0)
var dir := 1
var velocity := Vector2()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_slide_count() > 0:
		dir *= -1
		$AnimatedSprite.scale.x *= -1
		# To avoid double collision
		position.x += dir * 2
	velocity = move_and_slide(dir * speed, Vector2.UP)
