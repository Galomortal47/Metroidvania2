extends Node2D

func _physics_process(delta):
	get_node("circle").point_render = 17 - int(get_parent().timer.get_time_left() * 17) 
	