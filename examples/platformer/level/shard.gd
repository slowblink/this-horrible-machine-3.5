extends Area2D


var sprite: AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $AnimatedSprite
	sprite.animation = "Idle"
	sprite.playing = true


func _on_ShardArea2D_body_entered(body:Node):
	if body is KinematicBody2D:
		sprite.animation = "Explosion"
		get_node("%ExplanationDash").show()
		$Particles2D.emitting = true


func _on_AnimatedSprite_animation_finished():
	if sprite.animation == "Explosion":	
		sprite.hide()
		monitoring = false
