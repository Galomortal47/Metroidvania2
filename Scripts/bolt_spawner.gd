extends Node2D

var ammo_path = "res://assets/Pick Up.tscn"
var health_path = "res://assets/health pick up.tscn"
var bolt_path = "res://assets/Bolts.tscn"
var bolt_number = 7
var ramdom_pos = 30

func bolt_spawn(var bolt_number, var node, var pos):
	for i in range(0,bolt_number):
			var bolts =  load(bolt_path)
			var bolt_instance = bolts.instance()
#			bolt_instance.collect = true
			bolt_instance.set_position(pos+ Vector2(rand_range(-ramdom_pos,ramdom_pos),rand_range(-ramdom_pos,ramdom_pos)))
			node.add_child(bolt_instance)

func health_spawn(var node, var pos):
			var health2 =  load(health_path)
			var health_instance = health2.instance()
			health_instance.set_position(pos)
			health_instance.health = 5
			node.add_child(health_instance)

func ammo_spawn(var node, var pos):
	var  ammo =  load( ammo_path)
	var  ammo_instance =  ammo.instance()
	randomize()
	ammo_instance.gun_id = rand_range(0,8)
	ammo_instance.set_position(pos)
	node.add_child( ammo_instance)