extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var timer = 2.0
var timer_aux
var bomb = load("res://assets/Boxexplosive.tscn")
export var health = 40
var motion = Vector2(0,0)
var speed = 200
var pos_y = 0
var bolts_spwned_upon_death = 32
var boltspawner = preload("boltspawner.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pos_y = get_position().y
	timer_aux = timer
	$Health.health = health
	$Health.health_max = health
	pass # Replace with function body.

func _process(delta):
	$boss_1/AnimationPlayer.set_speed_scale(motion.x / speed)
	$CanvasLayer/Line2D.set_points([Vector2(160,50),Vector2(($Health.health*health*20/health) + 160,50)])
	get_parent().get_parent().get_node("Hooks").set_position(get_position())
	if $Health.health < 0:
		boltspawner.bolt_spawn(bolts_spwned_upon_death,get_tree().get_root(),get_position(),100)
		boltspawner.particle_spawn(get_tree().get_root(),get_position())
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
	set_position(Vector2(get_position().x,pos_y))
	motion = move_and_slide(motion)
#	pass

func stun():
	pass