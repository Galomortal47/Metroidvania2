extends Node2D

export var gun_id = 7
var rot = 0
var save = preload("res://Scripts/Save.gd").new()

func _ready():
	save.loader()
	if save.data.guns[gun_id]:
		get_parent().queue_free()
	save.save()
	$Sprite.texture = get_node("enemy/Monster2D-3D").get_child(gun_id+1).get_texture()
	pass # Replace with function body.

func _process(delta):
	if $RayCast2D.is_colliding():
		$CanvasLayer/Label.show()
		if Input.is_action_pressed("ui_roll") and $RayCast2D.get_collider().is_in_group("player"):
			$RayCast2D.get_collider().get_node("Weapons").get_child(gun_id).have = true
			$RayCast2D.get_collider().get_node("Anim/Viewport/Scale/Pick Up").set_current_animation("Pick Up")
			$Timer.start()
	else:
		$CanvasLayer/Label.hide()

func _on_Timer_timeout():
	get_parent().queue_free()
	pass # Replace with function body.
