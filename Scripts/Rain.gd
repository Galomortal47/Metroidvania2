extends Node2D

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
			climate (true,false,false)
		"snow":
			climate (false,true,false)
		"leaf":
			climate (false,false,true)
#	pass

func climate (rain,snow,leaf):
	$Rain.set_emitting(rain)
	$Snow.set_emitting(snow)
	$Leaf.set_emitting(leaf)