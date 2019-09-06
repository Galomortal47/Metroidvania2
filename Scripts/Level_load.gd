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
		for i in range(0,8):
			save.data.magazine[i] = body.get_node("Weapons").get_child(i).mag_aux
			save.data.ammo[i] = body.get_node("Weapons").get_child(i).ammo
		save.data.select = body.get_node("Menu Items").select
		save.data.state = body.state
		save.data.position_y = body.get_position().y
		save.data.position_x = body.get_position().x
		save.data.time = get_node("/root/Test/Day Night cycle").get_current_animation_position()
		save.save()
		var day = get_tree().get_root().get_node("Test/Day Night cycle")
		get_tree().change_scene(level_load)
	pass # Replace with function body.
