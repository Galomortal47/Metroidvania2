extends Sprite

export var scale2 = 1.0
export var type = "melee"

func _process(delta):
	if get_parent().get_parent().get_node("Vision").is_colliding() and type == "shooter":
		$AnimationPlayer2.set_current_animation("attack")
	if get_parent().get_parent().get_node("Damage").is_colliding() and type == "melee":
		$AnimationPlayer2.set_current_animation("attack")
	else:
		if get_parent().get_parent().motion.x > 0:
			$AnimationPlayer2.play("walk")
			get_parent().set_scale(Vector2(-1*scale2,1*scale2))
		elif get_parent().get_parent().motion.x < 0: 
			$AnimationPlayer2.play("walk")
			get_parent().set_scale(Vector2(1*scale2,1*scale2))
		elif int(get_parent().get_parent().motion.x) == 0:
			$AnimationPlayer2.play("idle")
#	pass
