extends Node2D

var speed = 50
var rage = 300
var hook = false
var area = Vector2(0,0)
var have = true
var enable = false
var ammo = 0
var ammo_max = 0

func _process(delta):
	if have and enable:
		for i in range(1,get_node("/root/Test/Hooks").get_child_count()+1):
			if Input.is_action_pressed("ui_cancel"):
				if get_global_position().distance_to(get_node("/root/Test/Hooks/Hook"+str(i)).get_global_position()) < rage:
					var rot = get_angle_to(get_node("/root/Test/Hooks/Hook"+str(i)).get_global_position())
					var dir = Vector2(cos(rot), sin(rot))
					get_parent().get_parent().motion += dir * speed
					$Line2D.set_points([get_position(),get_node("/root/Test/Hooks/Hook"+str(i)).get_global_position()-get_global_position()])
			else:
				$Line2D.set_points([Vector2(0,0),Vector2(0,0)])
				
			
func update_text():
	if have:
		get_parent().get_node("Label").set_text("infi/infi")

func reload():
	pass