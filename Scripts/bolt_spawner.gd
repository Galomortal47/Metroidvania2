extends Node2D

var bolt_path = "res://assets/Bolts.tscn"
var bolt_number = 7
var ramdom_pos = 30

func bolt_spawn(var bolt_number, var node, var pos):
	for i in range(0,bolt_number):
			var bolts =  load(bolt_path)
			var bolt_instance = bolts.instance()
#			bolt_instance.collect = true
			bolt_instance.set_position(pos+ Vector2(rand_range(-ramdom_pos,ramdom_pos),rand_range(-ramdom_pos,ramdom_pos)))
			node.add_child(bolt_instance)