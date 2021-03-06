extends KinematicBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enable = false
var motion = Vector2(0,0)
var speed = 100
var pos = Vector2(0,0)
var area_y = 500
var area_x = 1000
var size_min = 0.5
var size_max = 1.5
var size
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_modulate(Color(rand_range(0.5,1),rand_range(0.5,1),rand_range(0.5,1)))
	size = rand_range(size_min,size_max)
	set_scale(Vector2(size,size))
	pass # Replace with function body.
func _process(delta):
	if enable:
		$AnimationPlayer.set_current_animation("flying")
		var dir = Vector2(cos(get_rotation()), sin(get_rotation()))
		rotate(get_angle_to(pos))
		motion += dir * speed *delta
		motion = move_and_slide(motion)
	if $RayCast2D.is_colliding():
		enable = true
#	pass


func _on_Timer_timeout():
	randomize()
	pos = Vector2(rand_range(-area_x,area_x),rand_range(-area_y,area_y))+get_global_position()
	pass # Replace with function body.
