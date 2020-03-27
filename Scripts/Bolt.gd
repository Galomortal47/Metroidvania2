extends Node2D

var body2
var speed = 0.5
var accel = 1.1
var max_speed = 1000
var gravity = 10
var collect = false
var ramdom_pos = 120
var life_time = 1
var falloff = 0.95
var value = 1
var save = preload("res://Scripts/Save.gd").new()

func _ready():
	save.loader()
	randomize()
	var random = rand_range(0,1)
	var sprite = Sprite.new()
	if save.data.graphics == "fancy":
		if random > 0.5:
			sprite.texture = get_node("/root/singleton_models/Viewport").get_texture()
		else:
			sprite.texture = get_node("/root/singleton_models/Viewport2").get_texture()
	else:
		sprite.texture = load("res://sprites/boltsprite.png")
	add_child(sprite)

var player

func _physics_process(delta):
	player = get_node("/root/singleton_player").player_path
	if has_node(player):
		if get_position().distance_to(get_node(player).get_global_position()) < 300:
			collect = true
			gravity = 0
		if get_position().distance_to(get_node(player).get_global_position()) < 30:
			get_node(player).get_node("Coins/Number").set_text(str(int(get_node(player).get_node("Coins/Number").get_text())+value))
			get_node(player).get_node("Coins/AnimationPlayer").play("bolts")
			queue_free()
		if not $ground_detect.is_colliding():
			set_position(get_position() + Vector2(0,gravity))
		else:
			set_position(get_position() + Vector2(rand_range(-ramdom_pos,ramdom_pos)*delta,rand_range(-ramdom_pos,0)*delta))
			ramdom_pos *= falloff
		if collect:
			var rotation = get_angle_to(get_node(player).get_global_position())
			var dir = Vector2(cos(rotation), sin(rotation))
			set_position(get_position() + dir * (speed * delta))
			if speed < max_speed:
				speed *= accel

