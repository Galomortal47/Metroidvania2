extends Node2D

func _ready():
	get_node("hv_viewport/height_velocity").get_material()

func _physics_process(delta):
	if true:
		get_node("hv_viewport/height_velocity").get_material().set_shader_param("drop_position", (get_node('/root/singleton_player').pos_glob-get_node("tex_with_image").get_global_position()) / (Vector2(200,200)*get_parent().get_scale()))
	else:
		get_node("hv_viewport/height_velocity").get_material().set_shader_param("drop_position", Vector2(-1,-1))
#	pass
