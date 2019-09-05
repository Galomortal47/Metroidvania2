extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var save = preload("res://Scripts/Save.gd").new()
var scenary = load("res://assets/Day Night cycle.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	$Continue.grab_focus()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Continue_button_down():
	save.loader()
	save.save()
	get_tree().change_scene(save.data.level)
	pass # Replace with function body.

func _on_New_Game_button_down():
	save.save()
	get_tree().change_scene("res://assets/Room.tscn")
	pass # Replace with function body.


func _on_Quit_Game_button_down():
	get_tree().quit()
	pass # Replace with function body.

func _on_Button_button_down():
	if $
	pass # Replace with function body.
