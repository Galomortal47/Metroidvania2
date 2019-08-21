extends Node2D

export var health = 0
export var gun_id = 1
export var ammo = 10

func _on_Pick_Up_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.has_node("Health"):
		body.get_node("Health").health += health
		if health == 0:
			if body.is_in_group("player"):
				body.get_node("Weapons").get_child(gun_id).ammo = body.get_node("Weapons").get_child(gun_id).ammo_max
				body.get_node("Weapons").get_child(gun_id).update_text()
	queue_free()
	pass # Replace with function body.
