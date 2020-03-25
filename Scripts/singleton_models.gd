extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var loader = load("res://enemy/enemy.tscn").instance()
	add_child(loader)
	var loader2 = load("res://enemy/enemy2.tscn").instance()
#	loader2.set_position
	add_child(loader2)
	pass # Replace with function body.
