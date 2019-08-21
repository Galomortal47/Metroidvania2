extends Sprite

var speed = 500
var mouse_mode = false

#func _ready():
#	Input.set_mouse_mode(1)

func _process(delta):
	if Input.get_last_mouse_speed() > Vector2(50,50):
		mouse_mode = true
	if Input.is_action_pressed("ui_analog_up") or Input.is_action_pressed("ui_analog_down") or Input.is_action_pressed("ui_analog_right") or Input.is_action_pressed("ui_analog_left"):
		mouse_mode = false
	if mouse_mode:
		set_global_position(get_global_mouse_position())
	else:
		if Input.is_action_pressed("ui_analog_up"):
			set_position(get_position()+ Vector2(0,-speed *  delta))
		if Input.is_action_pressed("ui_analog_down"):
			set_position(get_position()+ Vector2(0,speed *  delta))
		if Input.is_action_pressed("ui_analog_right"):
			set_position(get_position()+ Vector2(speed *  delta,0))
		if Input.is_action_pressed("ui_analog_left"):
			set_position(get_position()+ Vector2(-speed *  delta,0))
#	pass
