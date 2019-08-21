extends KinematicBody2D

var motion = Vector2(0,0)
var speed = 30
var max_speed = 500
var drag = 0.7
var gravity = 10
var jump = 40
var jump_ledge = 300
var jump_aux = 0.0
var jump_timer = 0.15
var air_speed = 8
export var health = 20
var roll = 400
var roll_height = 150
var knockback = Vector2(0,0)
var max_speed_crouch = 200

func _ready():
	$Health.health = health
	$Health.health_max = health

func _process(delta):
	move()
	jump()
	roll()
	if not ground_detect() and not ledge_detect():
		motion.y += gravity
		jump_aux -= delta
	elif ledge_detect():
		ledge_grab()
	else:
		jump_aux = jump_timer
	motion = move_and_slide(motion)
	die()
#	pass

func die():
	if get_node("Health").health <= 0:
		$Save.data.money = int(int($Coins/Number.get_text()) * 0.75)
		$Save.save()
		get_tree().change_scene("res://assets/game over.tscn")

func roll():
	if Input.is_action_pressed("ui_roll") and not ledge_detect() and not Input.is_action_pressed("ui_block"):
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
	if Input.is_action_pressed("ui_accept") and jump_aux > 0:
		motion.y -= jump * Engine.get_time_scale()

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