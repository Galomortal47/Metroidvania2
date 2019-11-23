extends Node2D


var wall_dead_zone = 100
var stop_dead_zone = 1
var player

func _process(delta):
	animations()

func _ready():
	player = get_parent().get_parent().get_parent().get_parent()

func animations():
#	print(get_parent().get_node("AnimationPlayer").get_current_animation())
	match player.state:
		"walk":
			$Chocobo.hide()
			get_parent().get_node("Chocobo").stop()
			shoot_dir(true)
			if Input.is_action_pressed("ui_roll"):
				get_parent().get_node("AnimationPlayer").set_current_animation("roll")
			if not player.ground_detect() and not player.ledge_detect() and not Input.is_action_pressed("ui_roll"):
				get_parent().get_node("AnimationPlayer").set_current_animation("Jump")
			elif player.motion.x > wall_dead_zone or player.motion.x < -wall_dead_zone:
				if player.ground_detect() and not Input.is_action_pressed("ui_roll"):
					get_parent().get_node("AnimationPlayer").set_current_animation("Walk")
			if player.motion.x > stop_dead_zone and Input.is_action_pressed("ui_left") or player.motion.x < -stop_dead_zone and Input.is_action_pressed("ui_right"): 
				if player.ground_detect() and not Input.is_action_pressed("ui_roll"):
					get_parent().get_node("AnimationPlayer").set_current_animation("slide")
			elif int(player.motion.x) == 0 and not Input.is_action_pressed("ui_roll") and player.ground_detect():
				get_parent().get_node("AnimationPlayer").set_current_animation("Idle")
			if player.ledge_detect() and not player.ground_detect():
				get_parent().get_node("AnimationPlayer").set_current_animation("ledge grab")
		"swin":
			get_parent().get_node("AnimationPlayer").set_current_animation("swin")
			$Chocobo.hide()
		"chocobo":
			$Chocobo.show()
			shoot_dir(false)
			get_parent().get_node("AnimationPlayer").stop()
			if int(player.motion.x *0.1)  == 0 and player.ground_detect():
				get_parent().get_node("Chocobo").play("idle")
			elif player.ground_detect():
				get_parent().get_node("Chocobo").play("walk")
			if not player.ground_detect():
				get_parent().get_node("Chocobo").play("jump")
		"death":
			get_parent().get_node("Death").set_current_animation("Die")
			get_parent().get_node("Polygon2D/Label/Control/Button").grab_focus()
		"carring":
			get_parent().get_node("AnimationPlayer").set_current_animation("Walk_carry")
	if int(player.motion.x) > 0:
		get_parent().set_scale(Vector2(-1,get_parent().get_scale().y))
		get_parent().get_node("Polygon2D/Label").set_scale(Vector2(-8,8))
		particles_func()
	if int(player.motion.x) < 0:
		get_parent().set_scale(Vector2(1,get_parent().get_scale().y))
		get_parent().get_node("Polygon2D/Label").set_scale(Vector2(8,8))
		particles_func()
	elif int(player.motion.x) == 0:
		$CPUParticles2D.emitting = false
	if not player.ground_detect() or int(player.motion.x) == 0 and not Input.is_action_pressed("ui_roll"):
		get_parent().get_node("AnimationPlayer").set_speed_scale(1) 
	else:
		get_parent().get_node("AnimationPlayer").set_speed_scale(player.motion.x/500)  
#	pass

func shoot_dir(var hide):
		if player.state == "walk" or player.state == "chocobo":
			if Input.is_action_pressed("ui_cancel") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down") and not player.ledge_detect():
				get_parent().get_node("Shooting").play("shoot")
			elif Input.is_action_pressed("ui_up") and not player.ledge_detect():
				get_parent().get_node("Shooting").play("shoot up")
			elif Input.is_action_pressed("ui_down") and not player.ledge_detect():
				get_parent().get_node("Shooting").play("shoot down")
			elif hide:
				get_parent().get_node("Shooting").play("hide")
		else:
			get_parent().get_node("Shooting").play("hide")


func _on_Death_animation_finished(anim_name):
	get_tree().change_scene("res://assets/Main_Menu.tscn")
	pass # Replace with function body.

func particles_func():
	if  player.ground_detect():
		$CPUParticles2D.emitting = true
	else:
		$CPUParticles2D.emitting = false