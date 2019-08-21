extends CanvasLayer

var select = [false,false,false,false,false,false,false,false]
var select_aux = select
var menu_size = 8
var a = 0
var guns = [false,false,false,false,false,false,false,false]
func _ready():
	get_parent().get_node("Weapons/Label").menu_size = menu_size
	get_parent().get_node("Save").loader()
	for i in range(0,menu_size):
		get_parent().get_node("Weapons").get_child(i).have = get_parent().get_node("Save").data.gun[i]

func _process(delta):
	guns_have()
	if Input.is_action_pressed("ui_select"):
		Engine.set_time_scale(0.1) 
		$"Menu Anim".set_current_animation("open")
		menu_select()
		if Input.is_action_just_pressed("ui_left"):
			a -= 1
		if Input.is_action_just_pressed("ui_right"):
			a += 1
		if a < 0:
			a =  menu_size-1
		if a >  menu_size-1:
			a = 0
		select(a)
	else:
		$"Menu Anim".set_current_animation("close")
#		$Menu.set_scale(Vector2(0,0))
		Engine.set_time_scale(1) 

func menu_select():
	for i in range(0,menu_size):
		guns[i] = get_parent().get_node("Weapons").get_child(i).have
		get_parent().get_node("Save").data.gun = guns
		get_parent().get_node("Weapons").get_child(i).enable = select[i]
		if select[i]:
			if get_parent().get_node("Weapons").get_child(i).have:
				get_node("Menu/Label").set_text(str(get_parent().get_node("Weapons").get_child(i).get_name()))
				get_parent().get_node("Weapons").get_child(i).update_text()

func guns_have():
	for i in range(0,menu_size):
		if get_parent().get_node("Weapons").get_child(i).have:
			get_node("Menu/icon" + str(i)).set_modulate(Color(1,1,1))
		else:
			get_node("Menu/icon" + str(i)).set_modulate(Color(0.5,0.5,0.5))

func select(var x = 0):
	for i in range(0,menu_size):
		if i == x:
			get_node("Menu/icon" + str(i)).set_scale(Vector2(2,2))
			select[i] = true
		else:
			get_node("Menu/icon" + str(i)).set_scale(Vector2(1,1))
			select[i] = false