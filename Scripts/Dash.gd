extends Line2D

func _process(delta):
	if get_parent().roll_able:
		show()
	else:
		hide()