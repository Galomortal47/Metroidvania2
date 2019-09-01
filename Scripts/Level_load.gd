extends Area2D

export var level_load = ""

func _on_Level_load_body_shape_entered(body_id, body, body_shape, area_shape):
	get_tree().change_scene(level_load)
	pass # Replace with function body.
