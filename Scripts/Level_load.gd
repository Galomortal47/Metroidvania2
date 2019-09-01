extends Area2D

export var level_load = ""
var save = preload("res://Scripts/Save.gd").new()

func _on_Level_load_body_shape_entered(body_id, body, body_shape, area_shape):
	get_tree().change_scene(level_load)
	save.loader()
	save.data.position_y = body.get_position().y
	save.data.position_x = body.get_position().x
	save.save()
	pass # Replace with function body.
