extends Node2D

export var timer = 1.5
export var timer_aux = 1.5

func _process(delta):
	timer -= delta
	if timer < 0:
		var bullet = load("res://assets/Bullet.tscn")
		var bullet_instance = bullet.instance()
		bullet_instance.set_rotation_degrees(-90)
		bullet_instance.ignore = "enemy"
		bullet_instance.target = "player"
		bullet_instance.particle_size = 50
		bullet_instance.get_node("CPUParticles2D").set_color(Color(1,0,0))
		bullet_instance.set_global_position(get_global_position())
		get_tree().get_root().add_child(bullet_instance)
		timer = timer_aux
#	pass
