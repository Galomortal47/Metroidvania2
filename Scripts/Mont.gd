extends RayCast2D

func _process(delta):
	if is_colliding():
		if get_collider().is_in_group("player"):
			if Input.is_action_just_pressed("ui_cancel"):
				get_collider().state = "chocobo"
				get_parent().queue_free()
#	pass
