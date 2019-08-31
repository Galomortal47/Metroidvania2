extends KinematicBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	set_modulate(Color(rand_range(0.5,1),rand_range(0.5,1),rand_range(0.5,1)))
	pass # Replace with function body.
func _process(delta):
	randomize()
	motion.x += rand_range(-10,10)
	rotate(rand_range(-0.1,0.1))
	motion.y += rand_range(-10,10)
	motion = move_and_slide(motion)
#	pass
