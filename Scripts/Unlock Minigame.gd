extends Node2D

var have = true
var enable = false
var progress = 0
var code = [0,0,0,0]
var current = 0
var ammo = 0
var ammo_max = 0
var lock = false
var rot = 0

func _process(delta):
	$Line2D.default_color = (Color(-rot,rot,0))
	if Input.is_action_just_pressed("ui_cancel"):
		progress = 0
	if have and enable and Input.is_action_pressed("ui_cancel") and lock:
		for i in range(0,code.size()):
			randomize()
			code[i] = rand_range(-179,179)
		get_parent().get_parent().state = "pick_locking"
		show()
		if Input.is_action_pressed("trigger_l"):
			$Line2D.rotate(delta*2)
		if Input.is_action_pressed("trigger_r"):
			$Line2D.rotate(-delta*2)
		rot = $Line2D.get_rotation_degrees() / 18
		if $Line2D.get_rotation_degrees() > 180:
			$Line2D.set_rotation_degrees(180)
		if $Line2D.get_rotation_degrees() < -180:
			$Line2D.set_rotation_degrees(-180)
		if current < code.size():
			if int($Line2D.get_rotation_degrees() *0.5) == int(code[current]*0.5):

				current += 1
				progress += 100 / (code.size()-1)
				if progress > 100:
					progress = 100
				$Label.set_text(str(progress)+"/100")
	else:
		get_parent().get_parent().state = "walk"
		hide()
		progress = 0

#	pass
func update_text():
	if have:
		get_parent().get_node("Label").set_text("infi/infi")

func reload():
	pass
