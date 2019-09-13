extends Sprite

func _process(delta):
	if $RayCast2D.is_colliding():
		if $RayCast2D.get_collider().is_in_group("plauer") and Input.is_action_pressed("ui_roll"):
			$RayCast2D.get_collider().remove_group("player")
#	pass
