extends RayCast2D


func _process(delta):
	if is_colliding():
		if get_collider().is_in_group("player"):
			if get_collider().state == "walk":
				get_collider().state = "swin"
			if get_collider().state == "chocobo":
				get_collider().state = "chocobo_swin"
			particle_water()
	if $Swwing2.is_colliding():
		if $Swwing2.get_collider().is_in_group("player"):
			if $Swwing2.get_collider().state == "swin":
				$Swwing2.get_collider().state = "walk"
			if $Swwing2.get_collider().state == "chocobo_swin":
				$Swwing2.get_collider().state = "chocobo"
			particle_water()
func particle_water():
	if is_colliding():
		var particles = preload("res://assets/CPUParticles2D.tscn").instance()
		particles.set_position(get_collision_point())
		particles.amount = 1
		get_tree().get_root().add_child(particles)
#	pass
