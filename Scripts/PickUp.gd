extends Node2D

export var health = 0
export var gun_id = -1
export var ammo = 10


func _on_Pick_Up_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.has_node("Health"):
		body.get_node("Health").health += health
		if health == 0:
			if body.is_in_group("player"):
				for i in range(0,8):
					if body.get_node("Menu Items").select[i]:
						gun_id = i
						print(i)
						if gun_id == 0 or gun_id == 7 or gun_id == 8:
							gun_id = -1
				if not gun_id == -1:
					var text = load("res://assets/Dialog.tscn")
					var text_instance = text.instance()
					text_instance.get_node("Label").set_text("You Gained Ammo " + str(body.get_node("Weapons").get_child(gun_id).get_name()))
					get_parent().add_child(text_instance)
					body.get_node("Weapons").get_child(gun_id).ammo = body.get_node("Weapons").get_child(gun_id).ammo_max
					body.get_node("Weapons").get_child(gun_id).update_text()
	if not gun_id == -1:
		queue_free()
	pass # Replace with function body.
