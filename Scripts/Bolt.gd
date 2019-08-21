extends Node2D

var body2
var speed = 0.5
var accel = 1.1
var max_speed = 1000
var gravity = 10
var collect = false
var ramdom_pos = 120
var life_time = 1
var falloff = 0.95

func _process(delta):
	if not $ground_detect.is_colliding():
		set_position(get_position() + Vector2(0,gravity))
	else:
		set_position(get_position() + Vector2(rand_range(-ramdom_pos,ramdom_pos)*delta,rand_range(-ramdom_pos,0)*delta))
		ramdom_pos *= falloff
	if collect:
		var rotation = get_angle_to(body2.get_position())
		var dir = Vector2(cos(rotation), sin(rotation))
		set_position(get_position() + dir * (speed * delta))
		if speed < max_speed:
			speed *= accel

func _on_magnetic_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
		collect = true
		body2 = body
		gravity = 0
	pass # Replace with function body.

func _on_destroy_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
		body.get_node("Coins/Number").set_text(str(int(body.get_node("Coins/Number").get_text())+1))
		queue_free()
	pass # Replace with function body.
