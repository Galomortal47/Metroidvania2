extends Node2D

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_parent().get_node("Shooting").play("shoot")
	elif Input.is_action_pressed("ui_up"):
		get_parent().get_node("Shooting").play("shoot up")
	elif Input.is_action_pressed("ui_down"):
		get_parent().get_node("Shooting").play("shoot down")
	if int(get_parent().get_parent().motion.x) > 100:
		get_parent().set_scale(Vector2(-1,1))
		get_parent().get_node("AnimationPlayer").set_speed_scale(get_parent().get_parent().motion.x/500) 
		get_parent().get_node("AnimationPlayer").set_current_animation("Walk")
	if int(get_parent().get_parent().motion.x) < -100:
		get_parent().set_scale(Vector2(1,1))
		get_parent().get_node("AnimationPlayer").set_speed_scale(get_parent().get_parent().motion.x/500) 
		get_parent().get_node("AnimationPlayer").set_current_animation("Walk")
	if int(get_parent().get_parent().motion.x) == 0:
		get_parent().get_node("AnimationPlayer").set_current_animation("Idle")
#	pass
