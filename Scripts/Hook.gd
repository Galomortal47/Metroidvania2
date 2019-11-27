extends Node2D

var speed = 50
var rage = 1000
var rage2 = 150
var hook = false
var area = Vector2(0,0)
var have = true
var enable = false
var ammo = 0
var ammo_max = 0
var mag_aux
var damage
var current = 0
var close = 0

#func _ready():
#	if get_node("/root/Test/Hooks").get_child_count() > 0:
#		speed = speed / get_node("/root/Test/Hooks").get_child_count()

func _physics_process(delta):
	if have and enable and get_node("/root/Test/Hooks").get_child_count() > 0:
		if Input.is_action_just_pressed("ui_cancel"):
			close = get_closest()
		if Input.is_action_pressed("ui_cancel"):
			if get_distance(close) < rage:
				var rot = get_angle_to(get_node("/root/Test/Hooks").get_child(close).get_global_position())
				var dir = Vector2(cos(rot), sin(rot))
				get_parent().get_parent().motion += dir * speed
				$Line2D.set_points([get_position(),get_node("/root/Test/Hooks").get_child(close).get_global_position()-get_global_position()])
			else:
				$Line2D.set_points([Vector2(0,0),Vector2(0,0)])
		else:
			$Line2D.set_points([Vector2(0,0),Vector2(0,0)])
	else:
			$Line2D.set_points([Vector2(0,0),Vector2(0,0)])

func update_text():
	if have:
		get_parent().get_node("Label").set_text("infi/infi")

func reload():
	pass

func get_closest():
	var dist = []
	var smallest = []
	dist.resize(get_node("/root/Test/Hooks").get_child_count())
	smallest.resize(get_node("/root/Test/Hooks").get_child_count())
	for i in range(0,get_node("/root/Test/Hooks").get_child_count()):
		dist[i] = get_distance(i)
		smallest[i] = dist[i]
		if smallest[i] < rage2:
			smallest[i] *= 1000 
	smallest.sort()
	return dist.find(smallest[0])

func get_distance(var number):
	var distance = get_parent().get_parent().get_global_position().distance_to(get_node("/root/Test/Hooks").get_child(number).get_global_position())
	return distance