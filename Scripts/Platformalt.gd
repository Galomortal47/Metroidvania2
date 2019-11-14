extends KinematicBody2D

var motion = Vector2()
var speed = 100
var player
var inside = false
var target = Vector2()
func _ready():
	player = get_node("/root/Test/Player")
	target = get_parent().get_node("Target").get_global_position()

func _process(delta):
	if get_global_position().x > target.x:
		motion.x = speed
	else:
		motion.x = -speed
	motion = move_and_slide(motion)
	if inside:
		player.motion += motion *0.45



func _on_Sticker_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
		inside = true
	pass # Replace with function body.


func _on_Sticker_body_shape_exited(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
		inside = false
	pass # Replace with function body.
