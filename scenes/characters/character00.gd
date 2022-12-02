extends Spatial


### Automatic References Start ###
onready var _collision_shape: CollisionShape = $KinematicBody/CollisionShape
onready var _rigged_character: MeshInstance = $KinematicBody/Armature/Skeleton/rigged_character
### Automatic References Stop ###

##########################
## THIS NODE IS A FOR ANY NPC
## MODULATE COLOR AND MESH DEFORMS
##########################

# export var character color. probably want it to be a hex value
# I may not even want to export it, though. it could pull from a database entry, if I connect it to that.
