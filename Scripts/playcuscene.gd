extends Sprite

func _on_Area2D_body_entered(body):
	$CutScene.set_current_animation("1")
	pass # Replace with function body.

func carry():
	get_node("/root/Test/Player/Scale/Scientist anim").show()
	$"Scientist anim".hide()