extends KinematicBody2D

var motion = Vector2(0,0)
var speed = 100
var speed_aux
var temp_min = 3
var temp_max = 10
var grav = 100
var size_min = 0.5
var size_max = 1.0
var size
# Called when the node enters the scene tree for the first time.
func _ready():
	speed_aux = speed
	randomize()
	set_modulate(Color(rand_range(0.5,1),rand_range(0.5,1),rand_range(0.5,1)))
	$Timer.wait_time = rand_range(temp_min, temp_max)
	size = rand_range(size_min,size_max)
	set_scale(Vector2(size,size))

func _process(delta):
	motion.y += grav
	motion.x = speed
	if motion.x > 0:
		$body.set_scale(Vector2(-1,1))
	else:
		$body.set_scale(Vector2(1,1))
	motion = move_and_slide(motion)
#	pass

func _on_Timer_timeout():
	randomize()
	speed = rand_range(1,-1) * speed_aux
	$AnimationPlayer.set_speed_scale(speed / 100)
	$Timer.wait_time = rand_range(temp_min, temp_max)
	pass # Replace with function body.
