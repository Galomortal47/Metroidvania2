extends Node2D

func _on_Area2D_body_entered(body):
	print(body)
	var damage
	body.get_node("Health").damage(body.get_node("Health").health_max * 0.25)
	body.motion.y -= 1000
	pass # Replace with function body.
