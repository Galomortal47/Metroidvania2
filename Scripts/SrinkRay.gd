extends Node2D

var have = true
var enable = false
var ammo = 0
var ammo_max = 0
var shrink =false
var mag_aux
var damage
var tp = false
var pos

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and have and enable:
		if not tp:
			pos = get_parent().get_parent().get_position()
			tp = true
		else:
			get_parent().get_parent().set_position(pos)
			$AnimationPlayer.play("Tp")
			tp = false
#	pass
func update_text():
	if have:
		get_parent().get_node("Label").set_text("infi/infi")

func reload():
	pass