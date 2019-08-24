extends Area2D

func _on_Swimming_body_entered(body):
	if body.is_in_group("player"):
		body.state = "swin"
		$"Water Particles".set_global_position(body.get_global_position())
		$"Water Particles/CPUParticles2D".set_emitting(true)
	pass # Replace with function body.

func _on_Swimming_body_exited(body):
	if body.is_in_group("player"):
		body.state = "walk"
		$"Water Particles".set_global_position(body.get_global_position())
		$"Water Particles/CPUParticles2D".set_emitting(true)
	pass # Replace with function body.
