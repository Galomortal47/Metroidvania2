extends Node2D

func _ready():
	get_node("Monster").texture = get_node("Viewport").get_texture()
	pass # Replace with function body.
