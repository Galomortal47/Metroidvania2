extends Sprite

export var price = 2000


func _process(delta):
	if $RayCast2D.is_colliding():
		if $RayCast2D.get_collider().is_in_group("player"):
			price = $RayCast2D.get_collider().get_node("Save").data.hp_max * 500
			$Label.set_text(str("X TO BUY HEALTH PRICE : ", str(price)))
			$Label.show()
			if Input.is_action_just_pressed("ui_roll") and int($RayCast2D.get_collider().get_node("Coins/Number").get_text()) >= price:
				$RayCast2D.get_collider().get_node("Coins/Number").set_text(str(int($RayCast2D.get_collider().get_node("Coins/Number").get_text())-price))
				$RayCast2D.get_collider().get_node("Save").loader()
				$RayCast2D.get_collider().get_node("Save").data.hp += 1
				$RayCast2D.get_collider().get_node("Save").data.money = int($RayCast2D.get_collider().get_node("Coins/Number").get_text())
				$RayCast2D.get_collider().get_node("Save").data.hp_max += 1
				$RayCast2D.get_collider().get_node("Save").save()
				$RayCast2D.get_collider().get_node("Health_Load").load_health()
	else:
		$Label.hide()
#	pass

