extends AnimationPlayer

var save = preload("res://Scripts/Save.gd").new()


func _ready():
	set_speed_scale(1)
	play("day night")
	save.loader()
#	print(save.data.time)
	advance(save.data.time)
#	$Rain.climate = save.data.climate
	pass # Replace with function body.

func _process(delta):
	var color = get_node("Day Night cycle/CanvasModulate2").color
	get_node("Day Night cycle/ParallaxBackground/CanvasModulate").color = color
	get_node("Day Night cycle/ParallaxBackground2/CanvasModulate2").color = color
	get_node("Day Night cycle/ParallaxBackground3/CanvasModulate3").color = color
	get_node("Day Night cycle/Trees2/CanvasModulate4").color = color