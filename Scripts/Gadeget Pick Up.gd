extends Node2D

export var gun_id = 7
var rot = 0
func _ready():
	$Sprite.texture = get_node("enemy/Monster2D-3D/Viewport"+str(gun_id)).get_texture()
	pass # Replace with function body.

func _process(delta):
	if $RayCast2D.is_colliding():
		$CanvasLayer/Label.show()
		if Input.is_action_pressed("ui_roll"):
			$RayCast2D.get_collider().get_node("Weapons").get_child(gun_id).have = true
			queue_free()
	else:
		$CanvasLayer/Label.hide()