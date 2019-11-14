extends Node2D

var player
var parent = false

func _process(delta):
	stick(get_node("RayCast2D"))

func stick(var raycast):
	if raycast.is_colliding() and not has_node("Player"):
		player = raycast.get_collider()
		var pos =  player.get_global_position()
		player.get_parent().remove_child( player)
		self.add_child(player)
		player.set_global_position(pos)
		parent = true
	elif parent and not raycast.is_colliding() and not get_tree().get_root().get_node("Test").has_node("Player"):
		var pos = player.get_global_position()
		if has_node("Player"):
			self.remove_child(player)
		player.set_global_position(pos)
		if player.get_parent() == null:
			get_tree().get_root().get_node("Test").add_child(player)
		var parent = false