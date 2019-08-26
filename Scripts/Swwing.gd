extends RayCast2D

func _process(delta):
	if is_colliding():
		if get_collider().is_in_group("player"):
			if get_collider().state == "walk":
				get_collider().state = "swin"
	if $Swwing2.is_colliding():
		if $Swwing2.get_collider().is_in_group("player"):
			if $Swwing2.get_collider().state == "swin":
				$Swwing2.get_collider().state = "walk"
#	pass
