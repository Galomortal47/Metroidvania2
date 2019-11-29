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
var value = 20
var save = preload("res://Scripts/Save.gd").new()

func _ready():
	save.loader()
	randomize()
	var random = rand_range(0,1)
	if save.data.graphics == "fancy":
		if random > 0.5:
			var three_d_model = load("res://enemy/enemy.tscn")
			var model = three_d_model.instance()
			self.add_child(model)
		else:
			var three_d_model2 = load("res://enemy/enemy2.tscn")
			var model = three_d_model2.instance()
			self.add_child(model)
	else:
		var sprite = Sprite.new()
		sprite.texture = load("res://sprites/boltsprite.png")
		add_child(sprite)

var player = "/root/Test/Player"

func _physics_process(delta):
	if has_node(player):
		if get_position().distance_to(get_node(player).get_position()) < 300:
			collect = true
			gravity = 0
		if get_position().distance_to(get_node(player).get_position()) < 30:
			get_node(player).get_node("Coins/Number").set_text(str(int(get_node(player).get_node("Coins/Number").get_text())+value))
			get_node(player).get_node("Coins/AnimationPlayer").play("bolts")
			queue_free()
		if not $ground_detect.is_colliding():
			set_position(get_position() + Vector2(0,gravity))
		else:
			set_position(get_position() + Vector2(rand_range(-ramdom_pos,ramdom_pos)*delta,rand_range(-ramdom_pos,0)*delta))
			ramdom_pos *= falloff
		if collect:
			var rotation = get_angle_to(get_node(player).get_position())
			var dir = Vector2(cos(rotation), sin(rotation))
			set_position(get_position() + dir * (speed * delta))
			if speed < max_speed:
				speed *= accel

