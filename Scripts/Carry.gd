extends Node

var save = preload("res://Scripts/Save.gd").new()

func _ready():
	save.loader()
	get_parent().get_node("Animation/Hips/Scientist anim").set_visible(save.data.carry)