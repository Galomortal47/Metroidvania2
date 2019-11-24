extends RayCast2D

var carring = false

func _process(delta):
	if get_child_count() > 1:
		carring = true
	elif get_child_count() == 1 and get_parent().state == "carring":
		get_parent().state = "walk"
	if is_colliding():
		if not get_collider() == null:
			if get_collider().is_in_group("grabable"):
				$Polygon2D.show()
				if Input.is_action_just_pressed("ui_down")  and not get_parent().state == "carring":
					grab()
			else:
				$Polygon2D.hide()
	else:
		$Polygon2D.hide()
	if Input.is_action_just_pressed("ui_up") and get_parent().state == "carring" and carring:
		release(Vector2(0,0))
	if Input.is_action_just_pressed("ui_cancel") and get_parent().state == "carring" and carring:
		release(Vector2(300,300))

func release(var motion):
	var child = get_child(1)
	var pos = child.get_global_position()
	remove_child(child)
	get_tree().get_root().add_child(child)
	child.set_global_position(pos)
	child.motion += Vector2(motion.x * -get_parent().get_node("Anim/Viewport/Scale").get_scale().x,-motion.y)
	get_parent().state = "walk"

func grab():
	var boxs = get_collider()
	boxs.get_parent().remove_child(boxs)
	var pos = boxs.get_global_position()
	add_child(boxs)
	boxs.set_position(Vector2(0,0))
	get_parent().state = "carring"