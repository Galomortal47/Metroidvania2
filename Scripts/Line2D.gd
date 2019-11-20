extends Line2D

var begin = -150

func _ready():
	$RayCast2D.set_position(Vector2(begin,0))
	if begin > 0:
		$RayCast2D.set_rotation_degrees(180)
	else:
		$RayCast2D.set_rotation_degrees(0)


func _process(delta):
	$icon.set_position(Vector2(begin,0))
	if $RayCast2D.is_colliding():
		if not $RayCast2D.get_collider().is_in_group("goal"):
			line_drawn()
		elif $RayCast2D.get_collider().is_in_group("goal"):
			line_drawn()
	else:
		if begin > 0:
			set_points([Vector2(begin,0),Vector2(-150,0)])
		else:
			set_points([Vector2(begin,0),Vector2(150,0)])
#	pass

func line_drawn():
	var pos = $RayCast2D.get_collision_point()
	var dist = $pos.get_global_position().distance_to(pos)
	set_points([Vector2(begin,0),Vector2(dist-150,0)])