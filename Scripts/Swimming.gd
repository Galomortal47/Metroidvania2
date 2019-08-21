extends Area2D

func _on_Swimming_body_entered(body):
	if body.is_in_group("player"):
		body.state = "swin"
	pass # Replace with function body.

func _on_Swimming_body_exited(body):
	if body.is_in_group("player"):
		body.state = "walk"
	pass # Replace with function body.
