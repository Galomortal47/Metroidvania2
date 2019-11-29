extends RayCast2D

var water_jump = false

func _process(delta):
	if is_colliding():
		if get_collider().is_in_group("swin"):
			get_parent().state = "swin"
			water_jump = true
	else:
		get_parent().state = "walk"
		if water_jump:
			get_parent().motion.y -= 300
			water_jump = false
#	pass
