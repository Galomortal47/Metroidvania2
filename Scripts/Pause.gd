extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_pause"):
		get_tree().set_pause(!get_tree().is_paused())
		$CanvasLayer/Label.set_visible(get_tree().is_paused())
#	pass
