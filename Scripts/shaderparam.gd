extends Sprite

func _process(delta):
	var mouse_pos = Vector2((get_global_position().x - get_global_mouse_position().x) * 0.008 ,(get_global_position().y - get_global_mouse_position().y) * 0.008)
	get_material().set_shader_param("input",mouse_pos)
	print(mouse_pos)
