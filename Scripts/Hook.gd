extends Node2D

var speed = 150
var rage = 300
var rage2 = 150
var hook = false
var area = Vector2(0,0)
var have = true
var enable = false
var ammo = 0
var ammo_max = 0
var mag_aux
var damage

func _ready():
	if get_node("/root/Test/Hooks").get_child_count() > 0:
		speed = speed / get_node("/root/Test/Hooks").get_child_count()

func _physics_process(delta):
	if have and enable:
		for i in range(0,get_node("/root/Test/Hooks").get_child_count()):
			if Input.is_action_pressed("ui_cancel"):
				if get_global_position().distance_to(get_node("/root/Test/Hooks").get_child(i).get_global_position()) < rage:
					var rot = get_angle_to(get_node("/root/Test/Hooks").get_child(i).get_global_position())
					var dir = Vector2(cos(rot), sin(rot))
					if get_global_position().distance_to(get_node("/root/Test/Hooks").get_child(i).get_global_position()) > rage2:
						for j in range(0,get_node("/root/Test/Hooks").get_child_count()):
							if get_global_position().distance_to(get_node("/root/Test/Hooks").get_child(i).get_global_position()) < get_global_position().distance_to(get_node("/root/Test/Hooks").get_child(j).get_global_position()):
								get_parent().get_parent().motion += dir * speed
					$Line2D.set_points([get_position(),get_node("/root/Test/Hooks").get_child(i).get_global_position()-get_global_position()])
			else:
				$Line2D.set_points([Vector2(0,0),Vector2(0,0)])
				
			
func update_text():
	if have:
		get_parent().get_node("Label").set_text("infi/infi")

func reload():
	pass