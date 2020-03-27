extends Node2D

func _ready():
	if has_node("Viewport"):
		var alpha = get_node("Viewport").get_texture()
		get_node("example_2/tex_with_image").get_material().set_shader_param("alpha", alpha)

