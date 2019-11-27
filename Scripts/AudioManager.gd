extends Node2D
func _process(delta):
	if not int(get_parent().motion.x) == 0 and get_parent().ground_detect():
		$Footsteps.set_volume_db(0)
	else:
		$Footsteps.set_volume_db(-50)
	if Input.is_action_pressed("ui_roll") and not int(get_parent().motion.x) == 0 and not get_parent().ground_detect():
		$Roll.set_volume_db(0)
	else:
		$Roll.set_volume_db(-50)
	if Input.is_action_pressed("ui_accept"):
		$Jump.set_volume_db(0)
	else:
		$Jump.set_volume_db(-50)
	if get_parent().state == "swin" and not int(get_parent().motion.x) == 0:
		$Water.set_volume_db(0)
	else:
		$Water.set_volume_db(-50)
#	pass
