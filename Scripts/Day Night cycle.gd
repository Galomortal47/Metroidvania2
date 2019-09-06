extends AnimationPlayer

var save = preload("res://Scripts/Save.gd").new()


func _ready():
	set_speed_scale(1)
	play("day night")
	save.loader()
#	print(save.data.time)
	advance(save.data.time)
	save.save()
	pass # Replace with function body.
