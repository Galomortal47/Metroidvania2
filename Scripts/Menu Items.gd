extends CanvasLayer

var select = [false,false,false,false,false,false,false,false]
var select_aux = select
var menu_size = 8
var a = 0
var guns = [false,false,false,false,false,false,false,false]
var damage = [0,1,1,1,1,5,0,0]
var timer = 0.5
var time_aux
var size_selected = Vector2(0.4,-0.4)
var size_unselected = Vector2(0.2,-0.2)
var anim_path = "Anim/Viewport/Scale/Animation/Hips/Belt/body/arm up2/arm down/hand/weapons/enemy/Monster2D-3D/Monster"
var anim_path2 = "Anim/Viewport/Scale/Animation/Hips/Belt/body/arm up2/arm down/hand/weapons/enemy/Monster2D-3D"
var shadow_path3 = "Shadow/Viewport/Shadow/Animation/Hips/Belt/body/arm up2/arm down/hand/weapons/enemy/Monster2D-3D/Monster"

func _ready():
	icon_generate()
	time_aux = timer
	select = get_parent().get_node("Save").data.select
	get_parent().get_node("Weapons/Label").menu_size = menu_size
	get_parent().get_node("Save").loader()
	for i in range(0,menu_size):
		get_parent().get_node("Weapons").get_child(i).have = get_parent().get_node("Save").data.guns[i]
		get_parent().get_node("Weapons").get_child(i).mag_aux = get_parent().get_node("Save").data.magazine[i]
		get_parent().get_node("Weapons").get_child(i).ammo = get_parent().get_node("Save").data.ammo[i]
		get_parent().get_node("Weapons").get_child(i).damage = get_parent().get_node("Save").data.damage[i]
	guns = get_parent().get_node("Save").data.guns

func icon_generate():
	for i in range(0,menu_size):
		get_parent().get_node("Menu Items/Menu").get_child(i).texture = get_parent().get_node(anim_path2).get_child(i+1).get_texture()

func weapon_sprite(var select):
	if get_parent().get_node("Weapons").get_child(select).have:
		get_parent().get_node(anim_path).texture =  get_parent().get_node(anim_path2).get_child(select+1).get_texture()
		get_parent().get_node(shadow_path3).texture =  get_parent().get_node(anim_path2).get_child(select+1).get_texture()

var enabled = true

func _process(delta):
	guns_have()
	if enabled:
		controls()

func controls():
	if Input.is_action_pressed("ui_select"):
		$"Menu Anim".set_current_animation("open")
		Engine.set_time_scale(0.25) 
	else:
		$"Menu Anim".set_current_animation("close")
#		$Menu.set_scale(Vector2(0,0))
		Engine.set_time_scale(1) 
	menu_select()
	if Input.is_action_just_pressed("trigger_l"):
		a -= 1
	if Input.is_action_just_pressed("trigger_r"):
		a += 1
	if a < 0:
		a =  menu_size-1
	if a >  menu_size-1:
		a = 0
	weapon_sprite(a)
	select(a)


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
			get_node("Menu").get_child(i).set_self_modulate(Color(1,1,1,1))
		else:
			get_node("Menu").get_child(i).set_self_modulate(Color(1,1,1,0))

func select(var x = 0):
	for i in range(0,menu_size):
		if i == x:
			get_node("Menu/icon" + str(i)).set_scale(size_selected )
			select[i] = true
		else:
			get_node("Menu/icon" + str(i)).set_scale(size_unselected )
			select[i] = false

func _on_Bullet_Time_animation_finished(anim_name):
	print("anim")
	if anim_name == "timer":
		timer = time_aux
	pass # Replace with function body.
