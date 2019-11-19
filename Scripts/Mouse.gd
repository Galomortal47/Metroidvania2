extends KinematicBody2D

var speed = 500
var mouse_mode = false

#func _ready():
#	Input.set_mouse_mode(1)

func _process(delta):
	set_global_position(get_global_mouse_position())
#	pass
