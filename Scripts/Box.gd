extends KinematicBody2D

var boltspawner = preload("boltspawner.gd").new()
var bolt_path = "res://assets/Bolts.tscn"
var ammo_health = "res://assets/Pick Up.tscn"
var health_path = "res://assets/health pick up.tscn"
var explosive = preload("res://Scripts/explosion.gd").new()
export var bolt_number = 2
var ramdom_pos = 30
var motion = Vector2(0,0)
var spawn = false
var grav = 10
export var object = "bolt"
export var damage = 1
var air_drag = 0.99
var drag = 0.9
var spam = true

func _physics_process(delta):
	match object:
		"chest":
			if get_node("Chest/lock").lock:
				get_node("Health").health = 0
	if not $RayCast2D.is_colliding():
		motion.y += grav
		motion.x *= air_drag
	else:
		motion.x *= drag
#	if $RayCast2D2.is_colliding():
#		motion.x -= 20
#	if $RayCast2D3.is_colliding():
#		motion.x += 20

	motion = move_and_slide(motion)
	if $Health.health <= 0:
		match object:
			"bolt": 
				boltspawner.bolt_spawn(bolt_number,get_tree().get_root(),get_global_position(),3)
				boltspawner.particle_spawn(get_tree().get_root(),get_position())
				queue_free()
			"health":
				boltspawner.health_spawn(get_tree().get_root(),get_global_position())
				boltspawner.particle_spawn(get_tree().get_root(),get_global_position())
				queue_free()
			"ammo":
				boltspawner.ammo_spawn(get_tree().get_root(),get_global_position())
				boltspawner.particle_spawn(get_tree().get_root(),get_global_position())
				queue_free()
			"explosive":
				explosive.explosion(get_global_position(),get_tree().get_root(),"player","",damage,Color(1,0,0))
				queue_free()
			"chest":
				if spam :
					get_node("Chest/AnimationPlayer").play("open")
					boltspawner.bolt_spawn(bolt_number,get_tree().get_root(),get_global_position(),20)
					spam = false
	match object:
		"explosive":
			if $RayCast2D2.is_colliding() or $RayCast2D3.is_colliding() or motion.y > 300:
				$AnimationPlayer.play("boom")
			if $RayCast2D4.is_colliding():
				if $RayCast2D4.get_collider().is_in_group("player"):
					$AnimationPlayer.play("boom")
			

func stun():
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "boom":
		boltspawner.bolt_spawn(bolt_number,get_tree().get_root(),get_global_position())
		boltspawner.particle_spawn(get_tree().get_root(),get_position())
		explosive.explosion(get_global_position(),get_tree().get_root(),"player","",damage,Color(1,0,0))
		queue_free()
	pass # Replace with function body.
