extends Line2D

var begin = -150
var complexity = 0.0

func _ready():
	if has_node("Line2D"):
		randomize()
		if rand_range(0,1) > complexity:
			get_node("Line2D").queue_free()
		get_node("Line2D").begin = begin
		randomize()
		get_node("Line2D").set_rotation_degrees(int(rand_range(1,7))*45)
	$RayCast2D.set_position(Vector2(begin,0))
	if begin > 0:
		$RayCast2D.set_rotation_degrees(180)
	else:
		$RayCast2D.set_rotation_degrees(0)


func _process(delta):
	if get_parent().get_parent().enable:
		goal_find()

func goal_find():
	if has_node("Line2D"):
		get_node("Line2D").set_self_modulate(get_self_modulate())
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