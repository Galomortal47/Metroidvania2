extends Node2D

var have = true
var enable = false
var progress = 0
var code = [0,0,0,0]
var current = 0

func _ready():
	for i in range(0,code.size()):
		randomize()
		code[i] = rand_range(-180,180)
	print(code)

func _process(delta):
	if have and enable:
		get_parent().get_parent().state = "pick_locking"
		show()
		if Input.is_action_pressed("trigger_l"):
			$Line2D.rotate(delta)
		if Input.is_action_pressed("trigger_r"):
			$Line2D.rotate(-delta)
		var rot = $Line2D.get_rotation_degrees() / 18
		if current < code.size():
			if int($Line2D.get_rotation_degrees()) == int(code[current]):
				print(progress)
				current += 1
				progress += 100 / (code.size()-1)
				$Label.set_text(str(progress)+"/100")
		else:
			print("unlock")
		$Line2D.default_color = (Color(-rot,rot,0))
	else:
		hide()
		get_parent().get_parent().state = "walk"
#	pass
func update_text():
	if have:
		get_parent().get_node("Label").set_text("infi/infi")

func reload():
	pass
