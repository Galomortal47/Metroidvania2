extends CPUParticles2D

func _ready():
	$Timer.start()
	pass # Replace with function body.

func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
