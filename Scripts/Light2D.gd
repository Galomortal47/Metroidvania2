extends Light2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var save = preload("res://Scripts/Save.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	save.loader()
	match save.data.graphics:
		"fancy":
			set_enabled(true)
			show()
		"fast":
			set_enabled(false)
			hide()
	save.save()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
