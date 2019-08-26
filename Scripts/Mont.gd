extends RayCast2D

func _process(delta):
	if not $ground.is_colliding():
		get_parent().set_position(get_parent().get_position()+Vector2(0,200*delta))
	if is_colliding():
		if get_collider().is_in_group("player"):
			if Input.is_action_just_pressed("ui_cancel"):
				get_collider().state = "chocobo"
				get_parent().queue_free()
#	pass
