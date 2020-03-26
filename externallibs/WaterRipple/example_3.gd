extends Node2D

func _physics_process(delta):
	var size = Vector2(200,200)*get_parent().get_scale()
	var offset = get_node('/root/singleton_player').pos_glob-get_global_position() / get_scale()
	var offset2 = (get_global_transform_with_canvas().origin / size)
	offset2.x = 0
	offset2.y = -((offset2.y - 1.1) * 2)
#	print(offset2)
	get_node("tex_with_image").get_material().set_shader_param("own_position", offset2)
	get_node("hv_viewport/height_velocity").get_material().set_shader_param("drop_position", (get_node('/root/singleton_player').pos_glob-get_node("tex_with_image").get_global_position()) / (Vector2(200,200)*get_parent().get_scale()))

