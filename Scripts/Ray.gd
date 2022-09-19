extends Spatial

onready var in_dialog = false

func dialog_started(timeline_name):
	if timeline_name == "ray_timeline":
		in_dialog = true
		print (in_dialog)

func dialog_ended(timeline_name):
	if timeline_name == "ray_timeline":
		in_dialog = false
		print (in_dialog)
	
func _on_Player_interact(node):
	if node == $RaySit01/RayStaticBody and in_dialog == false:
		var dialog = Dialogic.start('/ray_timeline')
		dialog.connect("timeline_start", self, "dialog_started")
		dialog.connect("timeline_end", self, "dialog_ended")
		add_child(dialog)
