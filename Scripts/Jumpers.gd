extends RayCast2D

func _process(delta):
	if is_colliding():
		if get_collider().is_in_group("player"):
			get_collider().motion.y -= 50
			if get_parent().has_node("AnimationPlayer"):
				get_parent().get_node("AnimationPlayer").play("jump")
#	pass
