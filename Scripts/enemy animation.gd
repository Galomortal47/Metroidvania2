extends Sprite

func _process(delta):
	if get_parent().get_parent().motion.x > 0:
		$AnimationPlayer.play("walk")
		get_parent().set_scale(Vector2(-1,1))
	elif get_parent().get_parent().motion.x < 0: 
		$AnimationPlayer.play("walk")
		get_parent().set_scale(Vector2(1,1))
	elif int(get_parent().get_parent().motion.x) == 0:
		$AnimationPlayer.play("idle")
#	pass
