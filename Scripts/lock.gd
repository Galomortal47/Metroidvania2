extends Sprite

var contact = false
var player

func _process(delta):
	if contact:
		if player.get_node("Weapons/Unlock MiniGame").progress == 100:
			$AnimationPlayer.play("open")

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	contact = true
	player = body
	player.get_node("Weapons/Unlock MiniGame").lock = true
	if body.is_in_group("player"):
		body.get_node("Weapons/Unlock MiniGame").progress = 0
	pass # Replace with function body.



func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	contact = false
	player.state = "walk"
	player.get_node("Weapons/Unlock MiniGame").lock = false
	pass # Replace with function body.
