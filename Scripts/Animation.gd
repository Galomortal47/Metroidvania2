extends Node2D

func _process(delta):
	print(int(get_parent().get_parent().motion.x))
	if int(get_parent().get_parent().motion.x) > 100:
		get_parent().set_scale(Vector2(-1,1))
		get_parent().get_node("AnimationPlayer").set_current_animation("Walk")
	if int(get_parent().get_parent().motion.x) < -100:
		get_parent().set_scale(Vector2(1,1))
		get_parent().get_node("AnimationPlayer").set_current_animation("Walk")
	if int(get_parent().get_parent().motion.x) == 0:
		get_parent().get_node("AnimationPlayer").set_current_animation("Idle")
#	pass
