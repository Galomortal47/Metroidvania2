extends Sprite

export var material_fancy = preload("res://assets/Tiles/watershader.tres")
export var material_fast =  preload("res://assets/Tiles/watershaderfast.tres")

var save = preload("res://Scripts/Save.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	save()
	pass # Replace with function body.

func save():
	save.loader()
	match save.data.graphics:
		"fancy":
			material = material_fancy
		"fast":
			material = material_fast
	pass # Replace with function body.