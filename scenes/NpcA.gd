extends Spatial

export(Resource) var npc_data
var npc_material #generated below 

### Automatic References Start ###
onready var _animation_player: AnimationPlayer = $RiggedNPC/AnimationPlayer
onready var _collision_shape: CollisionShape = $CollisionShape
onready var _rigged_mesh: MeshInstance = $RiggedNPC/Armature/Skeleton/RiggedMesh
onready var _rigged_npc: Spatial = $RiggedNPC
### Automatic References Stop ###

onready var npc_name = npc_data.name
onready var npc_color = npc_data.color
onready var npc_idle = npc_data.idle_animation
onready var npc_body = npc_data.body_type



##########################
## THIS NODE IS A FOR ANY NPC
## MODULATE COLOR AND MESH DEFORMS
##########################

func _ready():
	infer_character_details()
func infer_character_details():
	generate_material()
	apply_material()
func generate_material():
	npc_material = SpatialMaterial.new()
	npc_material.flags_unshaded = true
	npc_material.albedo_color = npc_color 
func apply_material():
	_rigged_mesh.set_surface_material(0,npc_material)
