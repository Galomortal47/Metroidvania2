extends RayCast2D

export var level = "res://Test/Level 3.tscn"
export var pos = Vector2(0,0)
var save = load("res://Scripts/Level_load.gd").new()

func _process(delta):
	if is_colliding():
		$Label.show()
		if get_collider().is_in_group("player") and Input.is_action_pressed("ui_roll"):
			get_tree().change_scene(level)
			save.save(get_collider(),get_parent().get_node("pos"))
	else:
		$Label.hide()
#	pass
