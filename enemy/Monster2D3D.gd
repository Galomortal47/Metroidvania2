extends Node2D

var afterimage = load('res://assets/AfterImages.tscn')

func afterimage():
	var ai = afterimage.instance()
	ai.set_position(get_global_position())
	ai.texture = get_node("Viewport").get_texture()
	ai.set_scale(Vector2(1,-1))
	ai.set_modulate(Color(0,0.5,1,0.8))
	get_node('/root').add_child(ai)