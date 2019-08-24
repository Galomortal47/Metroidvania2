extends RayCast2D

var i
var select = 0
var price = [500,2000,3000,4000,8000,9000,1500,2500]
var items_n = 7

func _process(delta):
	if Input.is_action_pressed("ui_select"): 
		if Input.is_action_just_pressed("trigger_r"):
			select += 1
		if Input.is_action_just_pressed("trigger_l"):
			select -= 1
		if select > items_n:
			select = 0
		if select < 0:
			select = 7
	if is_colliding():
		for i in range(0,items_n+1):
			if select == i:
				get_node("Shop_Select/Icons").get_child(i).set_scale(Vector2(1.5,1.5))
				get_node("Shop_Select/Icons").get_child(i).set_modulate(Color(1,1,1))
			else:
				get_node("Shop_Select/Icons").get_child(i).set_scale(Vector2(0.5,0.5))
				get_node("Shop_Select/Icons").get_child(i).set_modulate(Color(0.5,0.5,0.5))
			if get_collider().is_in_group("player"):
				get_node("Shop_Select/Icons").show()
				get_node("Shop_Select/Icons/Label2").set_text(get_collider().get_node("Weapons").get_child(select).get_name())
				if   not get_collider().get_node("Weapons").get_child(select).have:
					get_node("Shop_Select/Icons/Label").set_text("X:Buy for a " +str(price[select]) +  " Bolts")
				else:
					get_node("Shop_Select/Icons/Label").set_text("you already have this one")
				if Input.is_action_just_pressed("ui_roll"):
					if  weapon_checker_money_checker():
						get_collider().get_node("Coins/Number").set_text(str(int(get_collider().get_node("Coins/Number").get_text())-price[select]))
						get_collider().get_node("Weapons").get_child(select).have = true
	elif is_colliding():
		get_node("Label").show()
	else:
		get_node("Shop_Select/Icons").hide()
		get_node("Label").hide()

func weapon_checker_money_checker():
		if int(get_collider().get_node("Coins/Number").get_text()) >= price[select] and not get_collider().get_node("Weapons").get_child(select).have:
			return true