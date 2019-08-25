extends RayCast2D

export var damage = 3
export var attack_range = 100
export var  screen_shake = 25
export var jump = 400

func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		set_cast_to(Vector2(-attack_range ,30))
	elif Input.is_action_just_pressed("ui_right"):
		set_cast_to(Vector2(attack_range ,30))
	if Input.is_action_pressed("ui_roll"):
		if is_colliding():
			if get_collider().is_in_group("enemy"):
				if get_collider().has_node("Health"):
					get_parent().get_node("Camera2D").shake += screen_shake
					get_parent().motion.y += jump
					get_collider().get_node("Health").health -= damage
