extends RayCast2D

func _process(delta):
	if is_colliding():
		if get_collider().is_on_group("player"):
			if get_parent().get_node("Day Night cycle").visible:
				get_parent().get_node("Day Night cycle").hide()
