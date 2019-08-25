extends RayCast2D

export var damage = 3
export var attack_range = 100

func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		set_cast_to(Vector2(-attack_range ,30))
	elif Input.is_action_just_pressed("ui_right"):
		set_cast_to(Vector2(attack_range ,30))
	if Input.is_action_pressed("ui_roll"):
		if is_colliding():
			if get_collider().is_in_group("enemy"):
				if get_collider().has_node("Health"):
					get_parent().motion += get_parent().motion * Vector2(-1,0.1)
					get_collider().get_node("Health").health -= damage
