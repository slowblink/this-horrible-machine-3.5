extends ProgressBar


func _ready():
	pass # Replace with function body.


# announce with a print when we arrive at the destination and then restart the progress, 
#probably using a signal

#func _process(delta):
#	pass


func _on_TripTimer_timeout():
	print ("the triptimer has completed!")
	value += 1
	pass # Replace with function body.
