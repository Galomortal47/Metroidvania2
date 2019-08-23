extends Node2D

func _process(delta):
	if get_parent().get_parent().motion.x > 0:
		get_parent().set_scale(Vector2(-1,1))
	else:
		get_parent().set_scale(Vector2(1,1))
#	pass
