extends RayCast2D

var i
var select = 0
var price = [99999,2000,3000,4000,4000,5000,99999,99999]
var enable = [false,false,true,true,true,true,false,false]
var items_n = 8

func _process(delta):
	if Input.is_action_just_pressed("trigger_r"):
		select += 1
	if Input.is_action_just_pressed("trigger_l"):
		select -= 1
	if select >= items_n:
		select = 0
	if select < 0:
		select = 7
	
	if is_colliding():
		if get_collider().get_global_position().x > $Scale.get_global_position().x:
			$Scale.set_scale(Vector2(-1,1))
		else:
			$Scale.set_scale(Vector2(1,1))
		for i in range(0,items_n):
			get_node("Shop_Select/Icons").get_child(i).texture = get_collider().get_node("Scale/Animation/Hips/Belt/body/arm up2/arm down/hand/weapons/enemy/Monster2D-3D").get_child(i+1).get_texture()
			if select == i:
				get_node("Shop_Select/Icons").get_child(i).set_scale(Vector2(0.5,-0.5))
				get_node("Shop_Select/Icons").get_child(i).set_modulate(Color(1,1,1))
			else:
				get_node("Shop_Select/Icons").get_child(i).set_scale(Vector2(0.25,-0.25))
				get_node("Shop_Select/Icons").get_child(i).set_modulate(Color(0.5,0.5,0.5))
			if get_collider().is_in_group("player"):
				get_node("Shop_Select/Icons").show()
				get_node("Shop_Select/Icons/Label2").set_text(get_collider().get_node("Weapons").get_child(select).get_name())
				if not get_collider().get_node("Weapons").get_child(select).have and enable[select]:
					get_node("Shop_Select/Icons/Label").set_text("X:Buy for a " +str(price[select]) +  " Bolts")
				elif not enable[select]:
					get_node("Shop_Select/Icons/Label").set_text(" ")
				else:
					get_node("Shop_Select/Icons/Label").set_text("you already have this one")
				if Input.is_action_just_pressed("ui_roll"):
					if  weapon_checker_money_checker():
						get_collider().get_node("Coins/Number").set_text(str(int(get_collider().get_node("Coins/Number").get_text())-price[select]))
						get_collider().get_node("Weapons").get_child(select).have = true
	else:
		get_node("Shop_Select/Icons").hide()

func weapon_checker_money_checker():
		if int(get_collider().get_node("Coins/Number").get_text()) >= price[select] and not get_collider().get_node("Weapons").get_child(select).have:
			return true