extends Node

func _ready():
	get_parent().get_node("Health").health = get_parent().get_node("Save").data.hp
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
