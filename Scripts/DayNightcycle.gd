extends AnimationPlayer

var save = preload("res://Scripts/Save.gd").new()


func _ready():
	set_speed_scale(2)
	play("day night")
	save.loader()
#	print(save.data.time)
	advance(save.data.time)
#	$Rain.climate = save.data.climate
	save.save()
	pass # Replace with function body.
