extends KinematicBody2D

var boltspawner = preload("bolt_spawner.gd").new()
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

func _process(delta):
	if not $RayCast2D.is_colliding():
		motion.y += grav
#	if $RayCast2D2.is_colliding():
#		motion.x -= 20
#	if $RayCast2D3.is_colliding():
#		motion.x += 20
	motion = move_and_slide(motion)
	if $Health.health <= 0:
		match object:
			"bolt": 
				boltspawner.bolt_spawn(bolt_number,get_tree().get_root(),get_global_position())
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
				explosive.explosion(get_global_position(),get_tree().get_root(),"player","",1,Color(1,0,0))
				queue_free()
	match object:
		"explosive":
			if $RayCast2D2.is_colliding() or $RayCast2D3.is_colliding() or motion.y > 200:
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
		explosive.explosion(get_global_position(),get_tree().get_root(),"player","",5,Color(1,0,0))
		queue_free()
	pass # Replace with function body.
