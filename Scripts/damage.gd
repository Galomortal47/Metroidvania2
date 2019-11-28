extends RayCast2D

export var attack_range = 100
export var  screen_shake = 75
var time = 0.93
export var jump = 0
export var damage = 1

func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		set_cast_to(Vector2(-attack_range ,30))
	elif Input.is_action_just_pressed("ui_right"):
		set_cast_to(Vector2(attack_range ,30))
	if Input.is_action_pressed("ui_roll") and roll_detect():
		collision_check(self)
		collision_check($Roll2)
		collision_check($Roll3)

func roll_detect():
	if not get_parent().roll_able or not get_parent().ground_detect():
		 return true

func collision_check(var node):
	if node.is_colliding() and not get_parent().motion.x == 0:
		if not  node.get_collider() == null:
			if  node.get_collider().is_in_group("enemy"):
				if  node.get_collider().has_node("Health"):
					get_parent().get_node("CamShake").shaker(screen_shake,time)
					get_parent().motion.y -= jump
					node.get_collider().get_node("Health").damage(damage)
