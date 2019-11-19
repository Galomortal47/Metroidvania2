extends KinematicBody2D

var goal = false

func _ready():
	look_at(get_parent().get_parent().get_node("Polygon2D2").get_global_position())

func _process(delta):
	if goal:
		set_modulate(Color(0,1,0))
	else:
		set_modulate(Color(1,0,0))
#	pass
