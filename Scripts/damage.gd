extends RayCast2D

export var attack_range = 100
export var  screen_shake = 25
export var jump = 0
export var damage = 0.25

func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		set_cast_to(Vector2(-attack_range ,30))
	elif Input.is_action_just_pressed("ui_right"):
		set_cast_to(Vector2(attack_range ,30))
	if Input.is_action_pressed("ui_roll"):
		if is_colliding() and not get_parent().motion.x == 0:
			if get_collider().is_in_group("enemy"):
				if get_collider().has_node("Health"):
					get_parent().get_node("CamShake").shake += screen_shake
					get_parent().motion.y -= jump
					if get_parent().motion.x > 0:
						get_collider().get_node("Health").health -= damage
					else:
						get_collider().get_node("Health").health -= damage
