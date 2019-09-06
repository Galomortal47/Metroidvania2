extends RayCast2D

export var level = "res://Test/Level 3.tscn"
var save = preload("res://Scripts/Save.gd").new()
export var pos = Vector2(0,0)

func _process(delta):
	if is_colliding():
		$Label.show()
		if get_collider().is_in_group("player") and Input.is_action_pressed("ui_roll"):
			get_tree().change_scene(level)
			save.loader()
			save.data.position_y = pos.y
			save.data.position_x = pos.x
			save.data.level = level
			save.data.time = get_node("/root/Test/Day Night cycle").get_current_animation_position()
			save.save()
	else:
		$Label.hide()
#	pass
