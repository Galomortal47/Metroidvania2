extends RayCast2D

var water_jump = false

func _process(delta):
	if is_colliding():
		if get_collider().is_in_group("swin"):
			get_parent().state = "swin"
			if not water_jump:
				if get_parent().motion.y < 400:
					get_parent().motion.y = 0
			water_jump = true
	else:
		get_parent().state = "walk"
		if water_jump:
			get_parent().motion.y = -500
			water_jump = false
#	pass
