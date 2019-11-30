extends Node2D

export var weapon = ""
var dir = 1
export var speed = 1000
export var bullet_n = 1
export var spreed = 0
export var timer = 2.0
export var gravity = 0
export var damage = 1.0
export var curve = 0
export var mag = 1
export var lifespan = 1.0
export var infinite = false
export var shot = 1
export var pierce = false
export var particle_size = 15
export var screen_shake = 10
export var time = 0.93
export var explosion = false
var mag_aux = mag
export var ammo = 100
var timer_aux = 0.0 
var enable = false
var ammo_max
export var have = false
export var explosion_color = Color(1,1,1)

func _ready():
	ammo_max = ammo
	mag_aux = mag

func _process(delta):
	if enable and have:
		if  get_parent().get_parent().state == "walk" or get_parent().get_parent().state == "chocobo":
			shoot()
	timer_aux -= delta
#	pass

func shoot():
	if Input.is_action_just_pressed("ui_left"):
		dir = 1
	elif Input.is_action_just_pressed("ui_right"):
		dir = 2
	elif Input.is_action_just_pressed("ui_up"):
		dir = 3
	elif Input.is_action_just_pressed("ui_down"):
		dir = 4
	if Input.is_action_pressed("ui_cancel") and timer_aux < 0 and mag_aux > 0 and not get_parent().get_parent().ledge_detect():
		timer_aux = timer
		if not infinite:
			mag_aux-= shot
		update_text()
		for i in range(0,bullet_n):
			get_parent().get_parent().get_node("CamShake").shaker(screen_shake,time)
			var bullet =  load(weapon)
			var bullet_instance = bullet.instance()
			bullet_instance.set_position(get_global_position())
			bullet_instance.speed = speed
			bullet_instance.gravity = gravity
			bullet_instance.damage = damage
			bullet_instance.curve = curve
			bullet_instance.lifespan = lifespan
			bullet_instance.pierce = pierce
			bullet_instance.particle_size = particle_size
			bullet_instance.explosion = explosion
			bullet_instance.explosion_color = explosion_color
			match (dir):
				1:
					bullet_instance.set_rotation_degrees(-180 +rand_range(-spreed,spreed))
				2:
					bullet_instance.set_rotation_degrees(0 +rand_range(-spreed,spreed))
				3:
					bullet_instance.set_rotation_degrees(-90 +rand_range(-spreed,spreed))
				4:
					bullet_instance.set_rotation_degrees(90 +rand_range(-spreed,spreed))
			get_tree().get_root().add_child(bullet_instance)
	elif mag_aux < 1 and ammo > 0:
		get_parent().get_parent().get_node("Load_Minigame/Minigame").set_current_animation("Load")

func update_text():
	if have:
		if infinite:
			get_parent().get_node("Label").set_text("infi/infi")
		else:
			get_parent().get_node("Label").set_text(str(mag_aux) + "/" + str(ammo)+"/"+str(ammo_max))

func reload():
	mag_aux = mag
	ammo -= mag