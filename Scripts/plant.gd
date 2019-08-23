extends Sprite

func _process(delta):
	if $RayCast2D.is_colliding():
		$AnimationPlayer.play("wind (copy)")
#	pass
