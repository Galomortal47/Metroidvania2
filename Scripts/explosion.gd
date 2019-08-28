extends Node

func explosion(var pos, node, target, ignore, var damage, var explosion_color):
	for i in range(0,21):
		var bullet = load("res://assets/Bullet.tscn")
		var bullet_instance = bullet.instance()
		bullet_instance.set_rotation(i *0.3)
		bullet_instance.set_position(pos)
		bullet_instance.get_node("CPUParticles2D").set_color(explosion_color)
		bullet_instance.ignore = ignore
		bullet_instance.target = target
		bullet_instance.speed = 175
		bullet_instance.damage = damage
		bullet_instance.lifespan = 1
		bullet_instance.pierce = true
		node.add_child(bullet_instance)