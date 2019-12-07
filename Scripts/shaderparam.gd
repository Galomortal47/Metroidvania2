extends Sprite

func _process(delta):
	var size = Vector2(32 * get_scale().x * 2,32 * get_scale().y * 2)
	var pos = get_global_position() - get_parent().get_node("Player").get_global_position()
	var mouse_pos = Vector2(pos .x / size.x ,pos .y / size.y)
	get_material().set_shader_param("input",mouse_pos)
