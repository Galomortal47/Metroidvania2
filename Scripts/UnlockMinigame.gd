extends Node2D

var have = true
var enable = true
var progress = []
var code = [false,false,false,false,false,false,false,false,false,false,false]
var current = 0
var ammo = 0
var ammo_max = 0
var lock = true
var rot = 0
var mag_aux
var damage
var line = "res://assets/Line2D.tscn"
var obs = "res://assets/Obs.tscn"
var goal = "res://assets/goal.tscn"
export var difficult = 4
export var difficult2 = 4
export var complexity = 0.5
export var complexity2 = 0.5
var select = 0

func _ready():
	keyhole_generate()
	obstacles_generate()
	goals_generate()

func goals_generate():
	for i in range(0,$lines.get_child_count()):
			var instance = load(goal)
			var instance_goal = instance.instance()
			randomize()
			var rand = rand_range(1,8)
			instance_goal.set_position($Polygon2D2.get_polygon()[rand]*Vector2(1.2,1.2))
			$goals.add_child(instance_goal)

func obstacles_generate():
	for i in range(0,$lines.get_child_count()):
		var instance = load(obs)
		var instance_obs = instance.instance()
		instance_obs.set_position(Vector2(0,(i*25)+75))
		$lines.get_child(i).get_node("pos2").add_child(instance_obs) 
		var random = rand_range(1,7)
		random = int(random)*45
		$lines.get_child(i).get_node("pos2").set_rotation_degrees(random)

func keyhole_generate():
	for i in range(0,difficult):
		randomize()
		if rand_range(0,1) > complexity:
			var instance = load(line)
			var instance_line = instance.instance()
			instance_line.set_rotation_degrees(i*45)
			randomize()
			var num = 150 - (i*25)
			if rand_range(0,1) > complexity2:
				instance_line.begin = -num
			else:
				instance_line.begin = num
			$lines.add_child(instance_line)

func _process(delta):
	controls()
	win()

func win():
	progress.resize($lines.get_child_count())
	var victor = []
	victor.resize($lines.get_child_count())
	for i in range(0,victor.size()):
		victor[i] = true
	for i in range(0,$lines.get_child_count()):
		progress[i] = $lines.get_child(i).goal
	if progress == victor:
		print("victory")

func controls():
	var open = true
	if Input.is_action_just_pressed("ui_cancel"):
		progress = 0
	if Input.is_action_just_pressed("ui_cancel"):
		open = !open
	if have and enable and open and lock:
		for i in range(0,$lines.get_child_count()):
			if i == select:
				$lines.get_child(select).default_color = (Color(1,0,0))
			else:
				$lines.get_child(i).default_color = (Color(1,0.8,0))
		if Input.is_action_just_pressed("ui_down"):
			if select <= $lines.get_child_count()-2:
				select += 1
		if Input.is_action_just_pressed("ui_up"):
			if select > 0:
				select -= 1
		var rot = $lines.get_child(select).get_rotation_degrees()
		if Input.is_action_just_pressed("trigger_l"):
			$lines.get_child(select).set_rotation_degrees(rot +45)
		if Input.is_action_just_pressed("trigger_r"):
			$lines.get_child(select).set_rotation_degrees(rot -45)
func reload():
	pass
