tool
extends State


onready var history = get_node("%History")

# FUNCTIONS AVAILABLE TO INHERIT

func _on_enter(_args) -> void:
	history.get_parent().show()


func _after_enter(_args) -> void:
	pass


func _on_update(_delta) -> void:
	for c in history.get_children():
		c.queue_free()

	var l = Label.new()
	l.text = "%s history:" % name
	history.add_child(l)

	for hist in get_active_states_history():
		var l1 = Label.new()
		l1.text = str(hist.keys())
		history.add_child(l1)


func _on_exit(_args) -> void:
	history.get_parent().hide()
