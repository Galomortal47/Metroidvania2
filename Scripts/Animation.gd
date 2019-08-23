extends Node2D


var wall_dead_zone = 100
var stop_dead_zone = 1

func _process(delta):
	animations()

func animations():
	if get_parent().get_parent().state == "walk":
		if Input.is_action_pressed("ui_cancel") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down") and not get_parent().get_parent().ledge_detect():
			get_parent().get_node("Shooting").play("shoot")
		elif Input.is_action_pressed("ui_up") and not get_parent().get_parent().ledge_detect():
			get_parent().get_node("Shooting").play("shoot up")
		elif Input.is_action_pressed("ui_down") and not get_parent().get_parent().ledge_detect():
			get_parent().get_node("Shooting").play("shoot down")
		else:
			get_parent().get_node("Shooting").play("hide")
		if Input.is_action_pressed("ui_roll"):
			get_parent().get_node("AnimationPlayer").set_current_animation("roll")
		if not get_parent().get_parent().ground_detect() and not get_parent().get_parent().ledge_detect():
			get_parent().get_node("Squash Jump").play("Squash")
			get_parent().get_node("AnimationPlayer").set_current_animation("Jump")
		elif get_parent().get_parent().motion.x > wall_dead_zone or get_parent().get_parent().motion.x < -wall_dead_zone and get_parent().get_parent().ground_detect():
			get_parent().get_node("AnimationPlayer").set_current_animation("Walk")
		elif get_parent().get_parent().motion.x > stop_dead_zone or get_parent().get_parent().motion.x < -stop_dead_zone and get_parent().get_parent().ground_detect():
			get_parent().get_node("AnimationPlayer").set_current_animation("slide2")
			print("slide")
		elif int(get_parent().get_parent().motion.x) == 0 and not Input.is_action_pressed("ui_roll"):
			get_parent().get_node("AnimationPlayer").set_current_animation("Idle")
		if get_parent().get_parent().ledge_detect() and not get_parent().get_parent().ground_detect():
			get_parent().get_node("AnimationPlayer").set_current_animation("ledge grab")
	elif get_parent().get_parent().state == "swin":
		get_parent().get_node("AnimationPlayer").set_current_animation("swin")
	if int(get_parent().get_parent().motion.x) > 0:
		get_parent().set_scale(Vector2(-1,get_parent().get_scale().y))
	if int(get_parent().get_parent().motion.x) < -0:
		get_parent().set_scale(Vector2(1,get_parent().get_scale().y))
	get_parent().get_node("AnimationPlayer").set_speed_scale(get_parent().get_parent().motion.x/500) 
#	pass

