extends Node2D

var have = true
var enable = false
var ammo = 0
var ammo_max = 0
var shrink =false
var mag_aux

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and have and enable and not shrink:
		shrink = true
	elif Input.is_action_just_pressed("ui_cancel") and have and enable and shrink:
		shrink = false
	if shrink:
		get_parent().get_parent().set_scale(Vector2(0.2,0.2))
	else:
		get_parent().get_parent().set_scale(Vector2(1,1))
#	pass
func update_text():
	if have:
		get_parent().get_node("Label").set_text("infi/infi")

func reload():
	pass