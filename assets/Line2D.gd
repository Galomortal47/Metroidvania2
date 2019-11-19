extends Line2D

var begin = -150
var goal = false

func _process(delta):
	$icon.set_position(Vector2(begin,0))
	if $RayCast2D.is_colliding():
		if not $RayCast2D.get_collider().is_in_group("goal"):
			goal = false
			var pos = $RayCast2D.get_collision_point()
	#		pos -= Vector2(150,0)
			var dist = $pos.get_global_position().distance_to(pos)
			set_points([Vector2(begin,0),Vector2(dist-150,0)])
		else:
			if begin > 0:
				set_points([Vector2(begin,0),Vector2(-150,0)])
			else:
				set_points([Vector2(begin,0),Vector2(150,0)])
	else:
		goal = true
#	pass
