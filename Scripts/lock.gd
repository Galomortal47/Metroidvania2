extends Sprite

var contact = false
var player 

func _ready():
	player = get_node("/root/Test/Player")

func _process(delta):
	if contact:
		if player.get_node("Weapons/Key").UNLOCK:
			$AnimationPlayer.play("open")

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	contact = true
#	player = body
#	player.get_node("Weapons/Key").lock = true
	pass # Replace with function body.

func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	if player.state == "pick_lock":
		contact = false
		player.state = "walk"
#		player.get_node("Weapons/Key").lock = false
	pass # Replace with function body.
