extends Node2D

func _process(delta):
	if Input.is_action_pressed("ui_cancel") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		get_parent().get_node("Shooting").play("shoot")
	elif Input.is_action_pressed("ui_up"):
		get_parent().get_node("Shooting").play("shoot up")
	elif Input.is_action_pressed("ui_down"):
		get_parent().get_node("Shooting").play("shoot down")
	else:
		get_parent().get_node("Shooting").play("hide")
	if Input.is_action_pressed("ui_accept"):
		get_parent().get_node("Squash Jump").play("Squash")
		get_parent().get_node("AnimationPlayer").set_current_animation("Jump")
	elif int(get_parent().get_parent().motion.x) > 100 and get_parent().get_parent().ground_detect():
		get_parent().get_node("AnimationPlayer").set_speed_scale(get_parent().get_parent().motion.x/500) 
		get_parent().get_node("AnimationPlayer").set_current_animation("Walk")
	elif int(get_parent().get_parent().motion.x) < -100 and get_parent().get_parent().ground_detect():
		get_parent().get_node("AnimationPlayer").set_speed_scale(get_parent().get_parent().motion.x/500) 
		get_parent().get_node("AnimationPlayer").set_current_animation("Walk")
	elif int(get_parent().get_parent().motion.x) == 0:
		get_parent().get_node("AnimationPlayer").set_current_animation("Idle")
	if get_parent().get_parent().ledge_detect() and not get_parent().get_parent().ground_detect():
		get_parent().get_node("AnimationPlayer").set_current_animation("ledge grab")
	if int(get_parent().get_parent().motion.x) > 100:
		get_parent().set_scale(Vector2(-1,1))
	if int(get_parent().get_parent().motion.x) < -100:
		get_parent().set_scale(Vector2(1,1))
#	pass
