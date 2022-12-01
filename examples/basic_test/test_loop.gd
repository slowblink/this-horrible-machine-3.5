tool
extends StateLoop


onready var loop_buttons = get_node("%HBCLoopButtons")

# FUNCTIONS AVAILABLE TO INHERIT

func _on_enter(_args) -> void:
	loop_buttons.show()


func _on_exit(_args) -> void:
	loop_buttons.hide()


func _on_LoopPrev_pressed():
	prev_in_loop()


func _on_LoopNext_pressed():
	next_in_loop()


func _on_LoopExit_pressed():
	exit_loop()


func _on_OptionButton_item_selected(index:int):
	match index:
		LoopMode.LOOP_DISABLED:
			loop_mode = LoopMode.LOOP_DISABLED
		LoopMode.LOOP_FORWARD:
			loop_mode = LoopMode.LOOP_FORWARD
		LoopMode.LOOP_BACKWARD:
			loop_mode = LoopMode.LOOP_BACKWARD
		LoopMode.LOOP_PING_PONG:
			loop_mode = LoopMode.LOOP_PING_PONG