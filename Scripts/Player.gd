extends KinematicBody2D

var motion = Vector2(0,0)
var speed = 20
var max_speed = 550
var drag = 0.9
var gravity = 20
var jump = 40
var jump_ledge = 450
var jump_aux = 0.0
var jump_timer = 0.15
var air_speed = 8
var roll = 2750
var roll_drag = 1
var roll_height = 0
var roll_timer = 1.5
var roll_boost = 0.15
var knockback = Vector2(0,0)
var max_speed_crouch = 200
var state = "walk"
var swin_speed = 10
var swin_speed_max = 250
var swin_drag = 0.95
var jump_count = 10
var jump_count_aux = jump_count
var boltspawner = preload("boltspawner.gd").new()
var timer = Timer.new()
var timer_boost = Timer.new()
var jetpack = false
var jetpackfall = 19
var roll_able = true
var roll_boost_active = true

func _ready():
	state = $Save.data.state
	timer.connect("timeout",self,"_on_timer_timeout") 
	timer.wait_time = roll_timer
	timer.set_one_shot(true)
	timer_boost.name = 'timer'
	add_child(timer)
	timer_boost.connect("timeout",self,"_on_timer_boost_timeout") 
	timer_boost.wait_time = roll_boost
	timer_boost.set_one_shot(true)
	timer_boost.name = 'timer_boost'
	add_child(timer_boost)

func jetpack_checker():
	jetpack = false
#	jetpack = get_node("Anim/Viewport/Scale/Animation/Hips/Scientist anim").visible

func _physics_process(delta):
	jetpack_checker()
	match state:
		"walk":
			move()
			max_speed = 550
			jump_count_aux = 10
			jump = 70
			if not jetpack:
				jump()
			else:
				jetjump()
			roll()
		"swin":
			swin()
		"pick_lock":
			if not ground_detect():
				motion.y += gravity
				motion.x = 0
		"chocobo":
			max_speed = 1000
			jump = 21
			jump_count_aux = 100
			move()
			jump()
			if Input.is_action_just_pressed("ui_roll"):
				state = "walk"
				boltspawner.spawn_choco(get_tree().get_root(),get_global_position())
			if ground_detect():
				jump_count = jump_count_aux
		"chocobo_swin":
			swin()
		"carring":
			max_speed = 400
			jump = 40
			jump_timer = 5
			move()
			jump()
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
	if Input.is_action_just_pressed("ui_roll") and not ledge_detect() and roll_able:
		if Input.is_action_pressed("ui_right") and roll_able:
			motion.x = roll
			roll_able = false
			collision(false)
			timer_boost.start()
			timer.start() #to start
		elif Input.is_action_pressed("ui_left") and roll_able:
			motion.x = -roll
			roll_able = false
			collision(false)
			timer_boost.start()
			timer.start() #to start
		elif Input.is_action_pressed("ui_up") and roll_able:
			motion.y = -roll
			roll_able = false
			collision(false)
			timer_boost.start()
			timer.start() #to start
#		elif Input.is_action_pressed("ui_down") and roll_able:
#			motion.y = roll
#			roll_able = false
#			collision(false)
#			timer_boost.start()
#			timer.start() #to start
	if Input.is_action_pressed("ui_roll") and roll_able:
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
	if not ground_detect() and not ledge_detect():
		motion.y += gravity
		jump_aux -= 1
	elif ground_detect():
		jump_count = jump_count_aux
	elif ledge_detect():
		ledge_grab()
	else:
		jump_aux = jump_timer

func jetjump():
	if Input.is_action_pressed("ui_accept") and not Input.is_action_pressed("ui_roll"):
		if jump_count > 0:
			motion.y -= jump
		elif motion.y > 0:
			motion.y -= jetpackfall
		jump_count -= 1
	if not ground_detect() and not ledge_detect():
		motion.y += gravity
	elif ground_detect():
		jump_count = jump_count_aux
	elif ledge_detect():
		ledge_grab()
	else:
		jump_aux = jump_timer


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

func _on_timer_timeout():
	roll_able = true

func collision(activate):
	set_collision_mask_bit(1,activate)
	set_collision_mask_bit(2,activate)
	set_collision_mask_bit(3,activate)
	set_collision_mask_bit(4,activate)
	set_collision_mask_bit(5,activate)
	set_collision_mask_bit(6,activate)
	set_collision_layer_bit(1,activate)
	set_collision_layer_bit(2,activate)
	set_collision_layer_bit(3,activate)
	set_collision_layer_bit(4,activate)
	set_collision_layer_bit(5,activate)
	set_collision_layer_bit(6,activate)

func _on_timer_boost_timeout():
	motion.x *= 0.2
	motion.y *= 0.2
	collision(true)
	timer_boost.wait_time = roll_boost
