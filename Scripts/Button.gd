extends Button

export var scene = "res://Test/Test.tscn"

func _on_Button_button_down():
	get_tree().change_scene(scene)
	pass # Replace with function body.
