extends Node

var save = "res://save.json"
var file = File.new()
var data = {"hp":20,
"level":"res://Levels/Test.tscn",
"money":100,"position_x":0,
"position_y":0,
 "guns" : [false,false,false,false,false,false,false,false]
}


func _ready():
	loader()
	save()

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
	