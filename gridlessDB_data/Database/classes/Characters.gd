extends Resource
class_name Characters

export (Color) var color = Color(0.73099, 0.077161, 0.914063, 1)
enum BodyTypes {A, B, C}
export(BodyTypes) var body_type = BodyTypes.A
export (String) var portrait = ""
enum IdleAnimations {Idle}
export(IdleAnimations) var idle_animation = IdleAnimations.Idle
export (String) var alias = ""
export (bool) var has_killed = 0
export (bool) var smokes = 0
export (bool) var drinks = 0
export (bool) var owns_a_weapon = 0
export (bool) var has_touched_the_decay = 0
export (bool) var wants_to_touch_the_decay = 0
export (String) var next_scene = ""
