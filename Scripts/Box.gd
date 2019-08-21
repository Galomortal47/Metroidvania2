extends RigidBody2D

var boltspawner = preload("bolt_spawner.gd").new()
var bolt_path = "res://assets/Bolts.tscn"
var ammo_health = "res://assets/Pick Up.tscn"
var bolt_number = 7
var ramdom_pos = 30
var motion = Vector2(0,0)
var spawn = false
func _process(delta):
	if $Health.health <= 0:
		boltspawner.bolt_spawn(bolt_number,get_tree().get_root(),get_position())
		queue_free()

func stun():
	pass