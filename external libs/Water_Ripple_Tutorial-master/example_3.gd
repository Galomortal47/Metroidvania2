extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_mouse"):
		get_node("hv_viewport/height_velocity").get_material().set_shader_param("drop_position", (get_global_mouse_position()-get_node("tex_with_image").get_position()) / get_node("tex_with_image").get_size())
	else:
		get_node("hv_viewport/height_velocity").get_material().set_shader_param("drop_position", Vector2(-1,-1))
#	pass
