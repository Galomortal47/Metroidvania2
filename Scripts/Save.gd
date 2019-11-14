extends Node

var save = "user://data.json"
var file = File.new()
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
"damage" : [0,0.01,0.1,0.1,0.1,0.5,0,0]
}


func _ready():
	loader()
	save()
	get_parent().set_position(Vector2(data.position_x,data.position_y))

func save():
	if file.open(save, File.WRITE) !=0:
		print("erro_write")
		return
	file.store_line(to_json(data))
	file.close()

func loader():
	if file.open(save, File.READ) !=0:
		print("erro_open")
		return
	data = parse_json(file.get_line())
	file.close()