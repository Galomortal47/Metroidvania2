extends Sprite

func _process(delta):
	var size = Vector2(32 * get_scale().x * 2,32 * get_scale().y * 2)
	var mouse_pos = Vector2((get_global_position().x - get_global_mouse_position().x) / size.x ,(get_global_position().y - get_global_mouse_position().y) / size.y)
	get_material().set_shader_param("input",mouse_pos)
