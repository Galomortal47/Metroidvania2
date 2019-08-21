extends RayCast2D

export var damage = 1
var enable = true
export var timer = 2.0
var timer_aux = 0.0 
export var attack_range = 100

func _process(delta):
	if enable:
		attack()
	timer_aux -= delta

func attack():
	if true:
		if Input.is_action_just_pressed("ui_left"):
			set_cast_to(Vector2(-attack_range ,0))
		elif Input.is_action_just_pressed("ui_right"):
			set_cast_to(Vector2(attack_range ,0))
		elif Input.is_action_just_pressed("ui_up"):
			set_cast_to(Vector2(0,-attack_range ))
		elif Input.is_action_just_pressed("ui_down"):
			set_cast_to(Vector2(0,attack_range ))
		if Input.is_action_pressed("ui_cancel"):
			if is_colliding():
				if get_collider().is_in_group("enemy"):
					if get_collider().has_node("Health"):
						get_collider().get_node("Health").health -= damage
		timer_aux = timer
func update_text():
	get_parent().get_node("Label").set_text("infinite/infinite")
	pass