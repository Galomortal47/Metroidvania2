extends Sprite

func _process(delta):
	if get_parent().get_parent().get_node("Damage").is_colliding():
		$AnimationPlayer2.play("attack")
	else:
		if get_parent().get_parent().motion.x > 0:
			$AnimationPlayer2.play("walk")
			get_parent().set_scale(Vector2(-1,1))
		elif get_parent().get_parent().motion.x < 0: 
			$AnimationPlayer2.play("walk")
			get_parent().set_scale(Vector2(1,1))
		elif int(get_parent().get_parent().motion.x) == 0:
			$AnimationPlayer2.play("idle")
#	pass
