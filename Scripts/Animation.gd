extends Node2D


var wall_dead_zone = 100
var stop_dead_zone = 1
var player
var animator

var gameoverscene = load('res://assets/DeatScreen.tscn').instance()

func _physics_process(delta):
	animations()

func _ready():
	animator = get_parent().get_node("AnimationPlayer")
	player = get_parent().get_parent().get_parent().get_parent()

func animations():
#	print(animator.get_current_animation())
	if player.get_node("Grab").carring:
		get_parent().get_node("Carrying").set_current_animation("carry")
	match player.state:
		"walk":
			$Chocobo.hide()
			get_parent().get_node("Chocobo").stop()
			shoot_dir(true)
			if roll_detect():
				if player.motion.y >= 0:
					animator.set_current_animation("roll")
				else:
					animator.set_current_animation("roll_up")
				get_parent().get_parent().get_parent().afterimage()
				get_parent().get_node("JetPack").set_current_animation("normal")
			if not player.ground_detect() and not player.ledge_detect() and not Input.is_action_pressed("ui_roll"):
				if player.motion.y < 0:
					animator.set_current_animation("Jump")
				else:
					animator.set_current_animation("fall")
				if player.jetpack:
					if Input.is_action_pressed("ui_accept"):
						if player.motion.y < 0:
							get_parent().get_node("JetPack").set_current_animation("normal")
						else:
							get_parent().get_node("JetPack").set_current_animation("jetdown")
					else:
						get_parent().get_node("JetPack").set_current_animation("normal")
			elif player.motion.x > wall_dead_zone or player.motion.x < -wall_dead_zone:
				if player.ground_detect() and not roll_detect():
					animator.set_current_animation("Walk")
					get_parent().get_node("JetPack").set_current_animation("normal")
			if player.motion.x > stop_dead_zone and Input.is_action_pressed("ui_left") or player.motion.x < -stop_dead_zone and Input.is_action_pressed("ui_right"): 
				if player.ground_detect() and not roll_detect():
					animator.set_current_animation("slide")
			elif int(player.motion.x) == 0 and not roll_detect() and player.ground_detect():
				animator.set_current_animation("Idle")
				get_parent().get_node("JetPack").set_current_animation("normal")
			if player.ledge_detect() and not player.ground_detect():
				animator.set_current_animation("ledge grab")
		"swin":
			animator.set_current_animation("swin")
			$Chocobo.hide()
		"chocobo":
			$Chocobo.show()
			shoot_dir(false)
			animator.stop()
			if int(player.motion.x *0.1)  == 0 and player.ground_detect():
				get_parent().get_node("Chocobo").play("idle")
			elif player.ground_detect():
				get_parent().get_node("Chocobo").play("walk")
			if not player.ground_detect():
				get_parent().get_node("Chocobo").play("jump")
		"death":
			get_parent().get_node("Death").set_current_animation("Die")
			get_node('/root').add_child(gameoverscene)
		"carring":
			get_parent().get_node("Carrying").set_current_animation("carry")
	if int(player.motion.x) > 0:
		get_parent().set_scale(Vector2(-1,get_parent().get_scale().y))
		particles_func()
	if int(player.motion.x) < 0:
		get_parent().set_scale(Vector2(1,get_parent().get_scale().y))
		particles_func()
	elif int(player.motion.x) == 0:
		$CPUParticles2D.emitting = false
	if not player.ground_detect() or int(player.motion.x) == 0 and not roll_detect():
		animator.set_speed_scale(1) 
	else:
		if player.motion.x > 0:
			animator.set_speed_scale(player.motion.x/500)  
		else:
			animator.set_speed_scale(player.motion.x/500 * -1)  
#	pass

func shoot_dir(var hide):
		if player.state == "walk" or player.state == "chocobo":
			if Input.is_action_pressed("ui_cancel") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down") and not player.ledge_detect():
				get_parent().get_node("Shooting").play("shoot")
			elif Input.is_action_pressed("ui_up") and not player.ledge_detect() and not roll_detect():
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

func roll_detect():
	if Input.is_action_pressed("ui_roll") and not player.get_node('timer_boost').is_stopped():
		return true