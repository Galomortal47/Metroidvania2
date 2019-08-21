extends Area2D


func _on_Platform_Sticker_body_shape_entered(body_id, body, body_shape, area_shape):
	var pos = body.get_global_position()
	get_tree().get_root().get_node("Test").remove_child(body)
	self.add_child(body)
	body.set_global_position(pos)
	pass # Replace with function body.


func _on_Platform_Sticker_body_shape_exited(body_id, body, body_shape, area_shape):
	var pos = body.get_global_position()
	self.remove_child(body)
	get_tree().get_root().get_node("Test").add_child(body)
	body.set_global_position(pos)
	pass # Replace with function body.
