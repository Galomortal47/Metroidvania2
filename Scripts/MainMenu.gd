extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var save = preload("res://Scripts/Save.gd").new()
var scenary = load("res://assets/DayNightcycle.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	$Continue.grab_focus()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Continue_button_down():
	save.loader()
	get_tree().change_scene(save.data.level)
	pass # Replace with function body.

func _on_New_Game_button_down():
	save.save()
	get_tree().change_scene(save.data.level)
	pass # Replace with function body.


func _on_Quit_Game_button_down():
	get_tree().quit()
	pass # Replace with function body.

func _on_Button_button_down():
	save.loader()
	get_node("Test/room/Node2D/light2").save()
	if $Graphics.get_text() == "Graphics:Fancy":
		$Graphics.set_text("Graphics:Fast")
		save.data.graphics = "fast"
	elif$Graphics.get_text() == "Graphics:Fast":
		$Graphics.set_text("Graphics:Fancy")
		save.data.graphics = "fancy"
	save.save()
	pass # Replace with function body.
	
func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(0 , (value - 90) * 0.6)
	pass # Replace with function body.
