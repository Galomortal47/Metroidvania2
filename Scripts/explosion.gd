extends Node

func explosion(var pos, node):
	for i in range(0,21):
		var bullet = load("res://assets/Bullet.tscn")
		var bullet_instance = bullet.instance()
		bullet_instance.set_rotation(i *0.3)
		bullet_instance.set_position(pos)
		bullet_instance.get_node("CPUParticles2D").set_color(Color(1,0,0))
		bullet_instance.ignore = "enemy"
		bullet_instance.target = "player"
		bullet_instance.speed = 175
		bullet_instance.lifespan = 1
		bullet_instance.pierce = true
		node.add_child(bullet_instance)