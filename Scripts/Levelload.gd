extends Area2D

export var level_load = ""
var save = preload("res://Scripts/Save.gd").new()
var pos2

func _on_Level_load_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
#		get_tree().change_scene(level_load)
		save(body,body,level_load)
		if thread.is_active():
			return
		thread.start(self, "_load", level_load)
	pass # Replace with function body.

var thread = Thread.new()
var level_resource

func _load(level):
	get_tree().change_scene(level)
#	save.data.position_y = pos2.get_position().y
#	save.data.position_x = pos2.get_position().x
#	save.save()

func save(var player,var pos, var level):
	save.loader()
	save.data.level = level
	save.data.money = int(player.get_node("Coins/Number").get_text())
	save.data.guns = player.get_node("Menu Items").guns
	save.data.hp = player.get_node("Health").health
	for i in range(0,8):
		save.data.magazine[i] = player.get_node("Weapons").get_child(i).mag_aux
		save.data.ammo[i] = player.get_node("Weapons").get_child(i).ammo
	save.data.select = player.get_node("Menu Items").select
	save.data.state = player.state
	save.data.carry = player.get_node("Scale/Animation/Hips/Scientist anim").is_visible()
	save.data.position_y = pos.get_position().y
	save.data.position_x = pos.get_position().x
	pos2 = pos
	var day = player.get_parent().get_node("Day Night cycle")
	save.data.time = day.get_current_animation_position()
	save.data.climate = player.get_node("Rain").climate
	save.save()
