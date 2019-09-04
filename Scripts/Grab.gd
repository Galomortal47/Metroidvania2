extends RayCast2D

var carring = false

func _process(delta):
	if get_child_count() > 1:
		carring = true
	elif get_child_count() == 1 and get_parent().state == "carring":
		get_parent().state = "walk"
	if is_colliding():
		if get_collider().is_in_group("grabable"):
			$Polygon2D.show()
			if Input.is_action_just_pressed("ui_down")  and not get_parent().state == "carring":
				grab()
		else:
			$Polygon2D.hide()
	if Input.is_action_just_pressed("ui_up") and get_parent().state == "carring" and carring:
		release(Vector2(0,0))
	if Input.is_action_just_pressed("ui_cancel") and get_parent().state == "carring" and carring:
		release(Vector2(500,500))

func release(var motion):
	var child = get_child(1)
	var pos = child.get_global_position()
	remove_child(child)
	get_tree().get_root().add_child(child)
	child.set_global_position(pos)
	child.motion += Vector2(motion.x * -get_parent().get_node("Scale").get_scale().x,-motion.y)
	get_parent().state = "walk"

func grab():
	get_collider().get_parent().remove_child(get_collider())
	var pos = get_collider().get_global_position()
	add_child(get_collider())
	get_collider().set_global_position(pos+Vector2(0,-150))
	get_parent().state = "carring"