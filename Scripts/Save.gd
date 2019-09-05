extends Node

var save = "res://save.json"
var file = File.new()
var data = {"hp":20,
"level":"res://Test/Level 3.tscn",
"money":0,"position_x":760,
"position_y":460,
 "guns" : [false,false,false,false,false,false,false,false]
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
	