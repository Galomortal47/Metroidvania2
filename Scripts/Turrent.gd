extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet = load("res://assets/Bullet.tscn")
var bullet_instance = bullet.instance()
var timer = 2.0
var timer_aux = timer
var enemies

func _ready():
	enemies = get_node("/root/Test/Enemies")

func _process(delta):
	timer -= delta
	for i in range(0,enemies.get_child_count()):
		if get_position().distance_to(enemies.get_child(i).get_position()) < 500 and timer < 0:
				bullet_instance.set_rotation(get_angle_to(enemies.get_child(i).get_position()))
				var bullet_instance = bullet.instance()
				bullet_instance.set_global_position(get_global_position())
				get_tree().get_root().add_child(bullet_instance)
				timer = timer_aux
#	pass
