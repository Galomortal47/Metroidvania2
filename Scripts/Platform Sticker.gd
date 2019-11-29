extends StaticBody2D

var body2

func _on_Platform_Sticker_body_shape_entered(body_id, body, body_shape, area_shape):
	if not body.get_parent() == self:
		body2 = body
		call_deferred("enter")

func enter():
	var pos = body2.get_global_position()
	get_tree().get_root().get_node("Test").remove_child(body2)
	self.add_child(body2)
	body2.set_global_position(pos)
	pass # Replace with function body.

func _on_Platform_Sticker_body_shape_exited(body_id, body, body_shape, area_shape):
	if not body.get_parent() == get_tree().get_root().get_node("Test"):
		body2 = body
		call_deferred("exit")

func exit():
	var pos = body2.get_global_position()
	self.remove_child(body2)
	get_tree().get_root().get_node("Test").add_child(body2)
	body2.set_global_position(pos)
	pass # Replace with function body.
