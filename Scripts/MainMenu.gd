extends Control

var save = preload("res://Scripts/Save.gd").new()
var scenary = load("res://assets/DayNightcycle.tscn").instance()
var data = {"hp":4,
"hp_max":4,
"level":"res://assets/Room.tscn",
"money":0,"position_x":690,
"position_y":460,
 "guns" : [false,true,false,false,false,false,false,false],
"time": 00,
"graphics": "fast",
"magazine" : [0,0,0,0,0,0,0,0],
"ammo" : [0,0,0,0,0,0,0,0],
"select" : [true,false,false,false,false,false,false,false],
"state" : "walk",
"cutscenes":[true,true,true,true,true,true,true,true],
"carry" : false,
"little_girl" : false,
"climate" : "clear",
"damage" : [0,1,1,5,1,1,0,0]
}

func _ready():
	$Continue.grab_focus()
	graphics()
	pass # Replace with function body.

func _on_Continue_button_down():
	save.loader()
	get_tree().change_scene(save.data.level)
	pass # Replace with function body.

func _on_New_Game_button_down():
	save.data = data
	save.save()
	get_tree().change_scene(save.data.level)
	pass # Replace with function body.

func _on_Quit_Game_button_down():
	get_tree().quit()
	pass # Replace with function body.

func _on_Button_button_down():
	graphics()
	pass # Replace with function body.
	
func graphics():
	save.loader()
	if $Graphics.get_text() == "Graphics:Fancy":
		$Graphics.set_text("Graphics:Fast")
		save.data.graphics = "fast"
	elif$Graphics.get_text() == "Graphics:Fast":
		$Graphics.set_text("Graphics:Fancy")
		save.data.graphics = "fancy"
	save.save()
	get_node("Test/room/Node2D/light2").save()