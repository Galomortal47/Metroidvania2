extends Light2D

var save = preload("res://Scripts/Save.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	save()
	pass # Replace with function body.

func save():
	save.loader()
	match save.data.graphics:
		"fancy":
			set_enabled(true)
			show()
		"fast":
			set_enabled(false)
			hide()
	pass # Replace with function body.