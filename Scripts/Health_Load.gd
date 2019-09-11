extends Node

func _ready():
	load_health()

func load_health():
	get_parent().get_node("Health").health = get_parent().get_node("Save").data.hp
	get_parent().get_node("Health").health_max = get_parent().get_node("Save").data.hp_max
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
