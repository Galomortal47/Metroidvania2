extends CanvasLayer

var rain_chance = 10000
var snow_chance = 30000
var leaf_chance = 20000
var climate = "clear"

func _process(delta):
	randomize()
	if 1 > rand_range(0,rain_chance):
		if climate == "clear":
			climate = "rain"
		elif climate == "rain":
			climate = "clear"
	if 1 > rand_range(0,snow_chance):
		if climate == "clear":
			climate = "snow"
		elif climate == "snow":
			climate = "clear"
	if 1 > rand_range(0,leaf_chance):
		if climate == "clear":
			climate = "leaf"
		elif climate == "leaf":
			climate = "clear"
	match climate:
		"rain":
			$Rain.set_emitting(!$Rain.is_emitting())
		"snow":
			$Snow.set_emitting(!$Snow.is_emitting())
		"leaf":
			$Leaf.set_emitting(!$Leaf.is_emitting())
#	pass
