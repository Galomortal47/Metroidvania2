extends StaticBody2D

var speed_block = 0.25
var max_speed_aux

func _ready():
	max_speed_aux = get_parent().max_speed

func _process(delta):
	if Input.is_action_pressed("ui_block") and not Input.is_action_pressed("ui_select") and not Input.is_action_pressed("ui_cancel") :
		$CollisionShape2D.set_disabled(false)
		get_parent().max_speed = max_speed_aux * speed_block
	else:
		$CollisionShape2D.set_disabled(true)
		get_parent().max_speed = max_speed_aux
	if Input.is_action_just_pressed("ui_left") and not Input.is_action_pressed("ui_block"):
		$CollisionShape2D.set_position(Vector2(-35,0))
	if Input.is_action_just_pressed("ui_right") and not Input.is_action_pressed("ui_block"):
		$CollisionShape2D.set_position(Vector2(35,0))
#	pass
