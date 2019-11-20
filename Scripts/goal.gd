extends KinematicBody2D

var goal = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]

func _ready():
	look_at(get_parent().get_parent().get_node("Polygon2D2").get_global_position())
	goal.resize(20)

func _process(delta):
	goal.sort()
	if goal[0] == 0:
		set_modulate(Color(0,1,0))
	else:
		set_modulate(Color(1,0,0))
#	pass
