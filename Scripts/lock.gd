extends Sprite

var contact = false
var player 
var lock = false
var random = true

func _ready():
	player = get_node("/root/Test/Player")

func _process(delta):
	if contact:
		lock = player.get_node("Weapons/Key").UNLOCK
		if lock:
			$AnimationPlayer.play("open")

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	call_deferred('enter', body)

func enter(var body):
	if body.is_in_group("player"):
		contact = true
		player.get_node("Weapons/Key").UNLOCK = false
		if random:
			get_node("/root/Test/Player/Weapons/Key").randomizer()
			random = false
#	player = body
#	player.get_node("Weapons/Key").lock = true
	pass # Replace with fu nnction body.

func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	call_deferred('exit')

func exit():
	if player.state == "pick_lock":
		contact = false
		player.state = "walk"
		random = true
#		player.get_node("Weapons/Key").lock = false
	pass # Replace with function body.
