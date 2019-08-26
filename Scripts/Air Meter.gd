extends CanvasLayer

var air = 0.0
var mod = 0.1
var mod2 = 2

func _process(delta):
	if get_parent().state == "swin":
		if air < 1.0:
			air += delta * mod
		else:
			get_parent().get_node("Health").damage(3)
	elif get_parent().state == "walk":
		if air > 0.0:
			air -= delta * mod2
	$Line2D.set_points([Vector2(900,95 + (air * 215)),Vector2(900,310)])
#	pass
