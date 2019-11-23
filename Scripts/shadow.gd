extends Node2D
#
func _process(delta):
	if get_parent().get_parent().ground_detect():
		show()
	else:
		hide()
#	pass
