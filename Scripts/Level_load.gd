extends Area2D

export var level_load = ""
var save = preload("res://Scripts/Save.gd").new()

func _on_Level_load_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
		$CanvasLayer/Label.show()
		save.loader()
		save.data.level = level_load
		save.data.money = int(body.get_node("Coins/Number").get_text())
		save.data.guns = body.get_node("Menu Items").guns
		save.data.hp = body.get_node("Health").health
		save.data.position_y = body.get_position().y
		save.data.position_x = body.get_position().x
		save.save()
		var day = get_tree().get_root().get_node("Test/Day Night cycle")
		get_tree().change_scene(level_load)
	pass # Replace with function body.
