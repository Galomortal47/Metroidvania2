extends KinematicBody2D

var boltspawner = preload("bolt_spawner.gd").new()
var bolt_path = "res://assets/Bolts.tscn"
var ammo_health = "res://assets/Pick Up.tscn"
var health_path = "res://assets/health pick up.tscn"
export var bolt_number = 3
var ramdom_pos = 30
var motion = Vector2(0,0)
var spawn = false
var grav = 10
export var object = "bolt"

func _ready():
	match object:
		"ammo":
			$box.set_texture(load("res://sprites/box - Ammo.png"))
		"health":
			$box.set_texture(load("res://sprites/box - health.png"))

func _process(delta):
	if not $RayCast2D.is_colliding():
		motion.y += grav
	if $RayCast2D2.is_colliding():
		motion.x -= 200
	if $RayCast2D3.is_colliding():
		motion.x += 200
	motion = move_and_slide(motion)
	if $Health.health <= 0:
		match object:
			"bolt": 
				boltspawner.bolt_spawn(bolt_number,get_tree().get_root(),get_position())
				boltspawner.particle_spawn(get_tree().get_root(),get_position())
				queue_free()
			"health":
				boltspawner.health_spawn(get_tree().get_root(),get_position())
				boltspawner.particle_spawn(get_tree().get_root(),get_position())
				queue_free()
			"ammo":
				boltspawner.ammo_spawn(get_tree().get_root(),get_position())
				boltspawner.particle_spawn(get_tree().get_root(),get_position())
				queue_free()


func stun():
	pass