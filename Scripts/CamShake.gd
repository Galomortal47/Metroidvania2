extends Camera2D

var shake = 0
var falloff = 0.9

func _process(delta):
	shake()
#	pass

func shake():
	randomize()
	set_position(Vector2(rand_range(-shake,shake),(rand_range(-shake,shake)-135)))
	shake *= falloff