extends Sprite

export var scale2 = 1.0
export var type = "melee"

func _process(delta):
	if get_parent().get_parent().get_node("Vision").is_colliding():
		get_node("arm4").rotate(get_parent().get_parent().get_node("Vision").rotation - get_node("arm4").rotation)
		$AnimationPlayer2.set_current_animation("attack")
		if get_parent().get_parent().get_node("Vision").get_rotation_degrees() > -180 and get_parent().get_parent().get_node("Vision").get_rotation_degrees() < 180:
			get_parent().set_scale(Vector2(-1*scale2,1*scale2))
			get_node("arm4").set_scale(Vector2(-1,-1))
		else:
			get_parent().set_scale(Vector2(1*scale2,1*scale2))
			get_node("arm4").set_scale(Vector2(1,1))

