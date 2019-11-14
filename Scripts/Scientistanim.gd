extends Node2D

var body_path = "Animation/Hips"

func _process(delta):
	set_scale(get_parent().get_node(body_path).get_scale() * Vector2(0.8,0.8))
	set_rotation(get_parent().get_node(body_path).get_rotation())
#	pass
