extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var timer = 2.0
var timer_aux
var bomb = load("res://assets/Box_explosive.tscn")
export var health = 40
var motion = Vector2(0,0)
var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	timer_aux = timer
	$Health.health = health
	$Health.health_max = health
	pass # Replace with function body.

func _process(delta):
	$CanvasLayer/Line2D.set_points([Vector2(160,50),Vector2(($Health.health*25.8) + 160,50)])
	get_parent().get_parent().get_node("Hooks").set_position(get_position())
	if $Health.health < 0:
		queue_free()
	timer -= delta
	if timer < 0:
		var boom = bomb.instance()
		if has_node("/root/Test/Player"):
			boom.set_position(get_node("/root/Test/Player").get_position()+ Vector2(0,-400))
			if get_node("/root/Test/Player").get_global_position().x -get_global_position().x > 0:
				motion.x = speed
			else:
				motion.x = -speed
		timer = timer_aux
		get_tree().get_root().add_child(boom)
	motion = move_and_slide(motion)
#	pass

func stun():
	pass