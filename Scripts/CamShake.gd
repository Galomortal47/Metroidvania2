extends Camera2D

var shake = 0
var falloff = 0.9
var offseter = 135  

func _process(delta):
	shake()
#	pass

func shake():
	randomize()
	set_position(Vector2(rand_range(-shake,shake),(rand_range(-shake,shake)-offseter)))
	shake *= falloff

func shaker(var amount, var time):
	shake += amount
	falloff = time