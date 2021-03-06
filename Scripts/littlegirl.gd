extends RayCast2D

var save = preload("res://Scripts/Save.gd").new()

func _ready():
	save.loader()
	$"little girl carry".set_visible(save.data.little_girl)

func _process(delta):
	if is_colliding():
		if get_collider().get_node("Scale/Animation/Hips/Scientist anim").is_visible():
			get_collider().get_node("Scale/Animation/Hips/Scientist anim").hide()
			$"little girl carry".show()
			save.loader()
			save.data.little_girl = true
			save.save()
			get_parent().get_node("CutScene2").play("2")
	pass
