extends KinematicBody2D
class_name boltspawner

var ammo_path = load("res://assets/PickUp.tscn")
var health_path = load("res://assets/healthpickup.tscn")
var bolt_path = load("res://assets/Bolts.tscn")
var particle_path = load("res://assets/CPUParticles2D.tscn")
var bolt_number2 = 7
var ramdom_pos = 30
var node2
var pos2
var thread = Thread.new()

func bolt_spawn(var bolt_number, var node, var pos,var bolt_value = 3):
	node2 = node
	pos2 = pos
	bolt_number2 = bolt_number
	_method_run_by_thread()

func _method_run_by_thread():
	for i in range(0,bolt_number2):
			var bolt_instance = bolt_path.instance()
			bolt_instance.set_position(pos2+ Vector2(rand_range(-ramdom_pos,ramdom_pos),rand_range(-ramdom_pos,ramdom_pos)))
			node2.get_child(0).add_child(bolt_instance)

func particle_spawn(var node, var pos):
	var particle =  particle_path
	var particle_instance = particle.instance()
	particle_instance.set_position(pos+ Vector2(rand_range(-ramdom_pos,ramdom_pos),rand_range(-ramdom_pos,ramdom_pos)))
	node.add_child(particle_instance)

func health_spawn(var node, var pos):
	var health2 =  health_path
	var health_instance = health2.instance()
	health_instance.set_position(pos)
	health_instance.health = 5
	node.add_child(health_instance)

func spawn_choco(var node, var pos):
	var spawn_choco = load("res://assets/Mont.tscn")
	var choco = spawn_choco.instance()
	choco.set_global_position(pos)
	node.add_child(choco)

func ammo_spawn(var node, var pos):
	var  ammo =  ammo_path
	var  ammo_instance =  ammo.instance()
	randomize()
	ammo_instance.gun_id = rand_range(0,8)
	ammo_instance.set_position(pos)
	node.add_child( ammo_instance)