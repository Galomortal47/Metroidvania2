extends Node2D


var wall_dead_zone = 100
var stop_dead_zone = 1

func _process(delta):
	animations()

func animations():
#	print(get_parent().get_node("AnimationPlayer").get_current_animation())
	match get_parent().get_parent().state:
		"walk":
			$Chocobo.hide()
			get_parent().get_node("Chocobo").stop()
			shoot_dir(true)
			if Input.is_action_pressed("ui_roll") and not get_parent().get_node("Scientist anim").is_visible():
				get_parent().get_node("AnimationPlayer").set_current_animation("roll")
			if not get_parent().get_parent().ground_detect() and not get_parent().get_parent().ledge_detect() and not Input.is_action_pressed("ui_roll"):
				get_parent().get_node("AnimationPlayer").set_current_animation("Jump")
			elif get_parent().get_parent().motion.x > wall_dead_zone or get_parent().get_parent().motion.x < -wall_dead_zone:
				if get_parent().get_parent().ground_detect() and not Input.is_action_pressed("ui_roll"):
					get_parent().get_node("AnimationPlayer").set_current_animation("Walk")
			if get_parent().get_parent().motion.x > stop_dead_zone and Input.is_action_pressed("ui_left") or get_parent().get_parent().motion.x < -stop_dead_zone and Input.is_action_pressed("ui_right"): 
				if get_parent().get_parent().ground_detect() and not Input.is_action_pressed("ui_roll"):
					get_parent().get_node("AnimationPlayer").set_current_animation("slide")
			elif int(get_parent().get_parent().motion.x) == 0 and not Input.is_action_pressed("ui_roll") and get_parent().get_parent().ground_detect():
				get_parent().get_node("AnimationPlayer").set_current_animation("Idle")
			if get_parent().get_parent().ledge_detect() and not get_parent().get_parent().ground_detect():
				get_parent().get_node("AnimationPlayer").set_current_animation("ledge grab")
		"swin":
			get_parent().get_node("AnimationPlayer").set_current_animation("swin")
			$Chocobo.hide()
		"chocobo":
			$Chocobo.show()
			shoot_dir(false)
			get_parent().get_node("AnimationPlayer").stop()
			if int(get_parent().get_parent().motion.x *0.1)  == 0 and get_parent().get_parent().ground_detect():
				get_parent().get_node("Chocobo").play("idle")
			elif get_parent().get_parent().ground_detect():
				get_parent().get_node("Chocobo").play("walk")
			else:
				get_parent().get_node("Chocobo").play("jump")
		"death":
			get_parent().get_node("Death").set_current_animation("Die")
		"carring":
			get_parent().get_node("AnimationPlayer").set_current_animation("Walk_carry")
	if int(get_parent().get_parent().motion.x) > 0:
		get_parent().set_scale(Vector2(-1,get_parent().get_scale().y))
		get_parent().get_node("Polygon2D/Label").set_scale(Vector2(-8,8))
	if int(get_parent().get_parent().motion.x) < -0:
		get_parent().set_scale(Vector2(1,get_parent().get_scale().y))
		get_parent().get_node("Polygon2D/Label").set_scale(Vector2(8,8))
	if not int(get_parent().get_parent().motion.x) == 0:
		get_parent().get_node("AnimationPlayer").set_speed_scale(get_parent().get_parent().motion.x/500) 
	else:
		get_parent().get_node("AnimationPlayer").set_speed_scale(1) 
#	pass

func shoot_dir(var hide):
		if get_parent().get_parent().state == "walk" or get_parent().get_parent().state == "chocobo":
			if Input.is_action_pressed("ui_cancel") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down") and not get_parent().get_parent().ledge_detect():
				get_parent().get_node("Shooting").play("shoot")
			elif Input.is_action_pressed("ui_up") and not get_parent().get_parent().ledge_detect():
				get_parent().get_node("Shooting").play("shoot up")
			elif Input.is_action_pressed("ui_down") and not get_parent().get_parent().ledge_detect():
				get_parent().get_node("Shooting").play("shoot down")
			elif hide:
				get_parent().get_node("Shooting").play("hide")
		else:
			get_parent().get_node("Shooting").play("hide")


func _on_Death_animation_finished(anim_name):
	get_tree().change_scene("res://assets/Main_Menu.tscn")
	pass # Replace with function body.
