extends KinematicBody2D

var motion = Vector2(0,0)
var speed = 100
var max_speed = 500
var drag = 0.8
var gravity = 10
var jump = 40
var jump_ledge = 300
var jump_aux = 0.0
var jump_timer = 0.15
var air_speed = 8
var roll = 400
var roll_height = 50
var knockback = Vector2(0,0)
var max_speed_crouch = 200
var state = "walk"
var swin_speed = 10
var swin_speed_max = 250
var swin_drag = 0.95
var jump_count = 10
var jump_count_aux = jump_count
var boltspawner = preload("bolt_spawner.gd").new()

func _ready():
	state = $Save.data.state

func _process(delta):
	match state:
		"walk":
			max_speed = 500
			jump = 80
			jump_count_aux = 5
			move()
			jump()
			roll()
			if not ground_detect() and not ledge_detect():
				motion.y += gravity
				jump_aux -= delta
			elif ground_detect():
				jump_count = jump_count_aux
			elif ledge_detect():
				ledge_grab()
			else:
				jump_aux = jump_timer
		"swin":
			swin()
		"pick_lock":
			if not ground_detect():
				motion.y += gravity
				motion.x = 0
		"chocobo":
			max_speed = 1000
			jump = 11
			jump_count_aux = 100
			move()
			jump()
			if Input.is_action_just_pressed("ui_roll"):
				state = "walk"
				boltspawner.spawn_choco(get_tree().get_root(),get_global_position())
			if not ground_detect():
				motion.y += gravity
				if Input.is_action_pressed("ui_accept"):
					jump_aux -= delta
			if ground_detect():
				jump_count = jump_count_aux
		"chocobo_swin":
			swin()
		"carring":
			max_speed = 500
			jump = 40
			jump_timer = 0.15
			move()
			jump()
			if not ground_detect():
				motion.y += gravity
			if Input.is_action_pressed("ui_accept"):
				jump_aux -= delta
	motion = move_and_slide(motion)
	die()
#	pass

func swin():
	$CollisionShape2D/Colision.set_current_animation("swin")
	if Input.is_action_pressed("ui_up"):
		if motion.y > -swin_speed_max:
			motion.y -= swin_speed
	elif Input.is_action_pressed("ui_down"):
		if motion.y < swin_speed_max:
			motion.y += swin_speed
	elif Input.is_action_pressed("ui_left"):
		if motion.x > -swin_speed_max:
			motion.x -= swin_speed
	elif Input.is_action_pressed("ui_right"):
		if motion.x < swin_speed_max:
			motion.x += swin_speed
	else:
		motion.x *= swin_drag
		motion.y *= swin_drag

func die():
	if get_node("Health").health <= 0:
		$Save.data.money = int(int($Coins/Number.get_text()))
		$Save.save()
		state = "death"

func roll():
	if Input.is_action_pressed("ui_roll") and not ledge_detect() and not get_node("Scale/Scientist anim").is_visible():
		if Input.is_action_pressed("ui_right"):
			if ground_detect():
				if motion.x < max_speed + roll:
					motion.x += roll
				motion.y -= roll_height
		elif Input.is_action_pressed("ui_left"):
			if ground_detect():
				if motion.x > -max_speed - roll:
					motion.x -= roll
				motion.y -= roll_height
	if Input.is_action_pressed("ui_roll"):
		$CollisionShape2D/Colision.set_current_animation("roll")
	else:
		$CollisionShape2D/Colision.set_current_animation("normal")

func ledge_grab():
	if Input.is_action_just_pressed("ui_accept"):
		motion.y -= jump_ledge
	else:
		motion.y = 0

func jump():
	if Input.is_action_pressed("ui_accept") and jump_count > 0 and not Input.is_action_pressed("ui_roll"):
		motion.y -= jump
		jump_count -= 1

func move():
	if Input.is_action_pressed("ui_right"):
		if motion.x < max_speed:
			if ground_detect():
				motion.x += speed
			else:
				motion.x += air_speed
	elif Input.is_action_pressed("ui_left"):
		if motion.x > -max_speed:
			if ground_detect():
				motion.x -= speed
			else:
				motion.x -= air_speed
	elif ground_detect():
		motion.x *= drag

func ground_detect():
	if $Groud_Middle.is_colliding() or $Ground_Left.is_colliding() or $Ground_Right.is_colliding():
		return true

func ledge_detect():
	if $Ledge_Grab_L.is_colliding() or $Ledge_Grab_R.is_colliding():
		if not $Ledge_Grab_L2.is_colliding() and not $Ledge_Grab_R2.is_colliding():
			return true

func stun():
	if motion.x  > 0:
		motion += Vector2(-500,-300)
	else:
		motion += Vector2(500,-300)