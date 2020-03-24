extends Button

export var scene = "res://Test/Level 1.tscn"
export var button = true

func _input(event):
	if Input.is_action_just_pressed("ui_roll") and button:
		get_tree().change_scene(scene)
		get_parent().get_parent().get_parent().get_parent().queue_free()
	pass # Replace with function body.

func _on_Button_button_down():
	get_tree().change_scene(scene)
	get_parent().get_parent().get_parent().get_parent().queue_free()
	pass # Replace with function body.
