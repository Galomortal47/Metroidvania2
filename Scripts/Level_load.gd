extends Area2D

export var level_load = ""
var save = preload("res://Scripts/Save.gd").new()
var player

func _on_Level_load_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
		player = body
		get_tree().change_scene(level_load)
		save()
#		if thread.is_active():
#			return
#		thread.start(self, "_load", level_load)
#	pass # Replace with function body.
#
#var thread = Thread.new()
#var level_resource

func _load(level):
	get_tree().change_scene(level)
	save()

func save():
	save.loader()
	save.data.level = level_load
	save.data.money = int(player.get_node("Coins/Number").get_text())
	save.data.guns = player.get_node("Menu Items").guns
	save.data.hp = player.get_node("Health").health
	for i in range(0,8):
		save.data.magazine[i] = player.get_node("Weapons").get_child(i).mag_aux
		save.data.ammo[i] = player.get_node("Weapons").get_child(i).ammo
	save.data.select = player.get_node("Menu Items").select
	save.data.state = player.state
	save.data.carry = player.get_node("Scale/Scientist anim").is_visible()
	save.data.position_y = player.get_position().y
	save.data.position_x = player.get_position().x
	save.data.time = get_node("/root/Test/Day Night cycle").get_current_animation_position()
	save.data.climate =get_node("/root/Test/Day Night cycle/Rain").climate
	save.save()
	var day = get_tree().get_root().get_node("Test/Day Night cycle")