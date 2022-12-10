extends Resource
class_name Characters

export (Color) var color = Color(0.73099, 0.077161, 0.914063, 1)
enum BodyTypes {A, B, C}
export(BodyTypes) var body_type = BodyTypes.A
export (String) var portrait = ""
export (String) var dialogic_character_file = "dialogic/characters/character-1670019414.json"
enum IdleAnimations {Idle}
export(IdleAnimations) var idle_animation = IdleAnimations.Idle
export (String) var name = ""
enum StageShapes {}
export(StageShapes) var stage_shape 
export (bool) var has_killed = 0
export (bool) var smokes = 0
export (bool) var drinks = 0
export (bool) var owns_a_weapon = 0
export (bool) var has_touched_the_decay = 0
export (bool) var wants_to_touch_the_decay = 0
