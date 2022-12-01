tool
extends State


# FUNCTIONS AVAILABLE TO INHERIT

func _on_update(_delta) -> void:
	write_active_states()


func _on_Goto1_pressed():
	if not is_active("State1"):
		change_state("State1")
	else:
		if is_active("Substate1"):
			change_state("Substate2")
		else:
			change_state("Substate1")

	if was_state_active("Substate1"):
		print("Substate1 was active")
	elif was_state_active("Substate2"):
		print("Substate2 was active")
	else:
		print("who was active ?")
	

func _on_GotoRegions_pressed():
	change_state("StateRegions")


func _on_GotoLoop_pressed():
	change_state("StateLoop")


func write_active_states():
	var result = ""
	for s in active_states:
		result = "%s %s" % [result, s]
	var main = get_parent()
	var act = main.get_node("%ActiveStates")
	act.text = result