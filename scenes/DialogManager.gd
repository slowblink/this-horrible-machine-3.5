extends Node


### Automatic References Start ###
onready var _timer: Timer = $Timer
### Automatic References Stop ###

#########################################
# TASKS & NOTES
#########################################

# [] fix the error that crashes the game when 10 seconds pass after dialog.
# my method of closing the dialog isn't working, so I need to try something else.
# the timer is probably a bad idea anyway.


#########################################
#VARIABLES
#########################################

onready var timeline_request = ""
onready var in_dialog = false
onready var new_dialog
onready var current_timeline = ""

#	var new_dialog = Dialogic.start('meeting') #choosing the book to grab from the shelf
#	add_child(new_dialog)#start reading it
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Player_dialog_interact(start_request, npc, npc_next_scene):
	if start_request and not in_dialog:
		in_dialog = true
		# figure out which timeline to pull for this. use the character, and
		# then use a bookmark to keep track of where the conversation has gone.
		# although it's also possible that dialogic tracks this on its own and
		# timelines can be made much longer
		new_dialog = Dialogic.start(npc_next_scene)
		current_timeline = npc_next_scene
		new_dialog.connect ("dialogic_signal", self, "dialog_listener")
		add_child(new_dialog)#start reading it
		pass 
	else: # means the request was to switch off dialog
		pass

func _on_Timer_timeout(): #when the timer runs out, close the dialog
	if in_dialog:
		#$Dialog.timeline_end(current_timeline)
		in_dialog = false
		#current_timeline = ""

func dialogic_signal(string):
	match string:
		"cooldown":
			_timer.start()
