extends AudioStreamPlayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var distance = 960
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if has_node("/root/Test/Player"):
		for i in range(0,get_node("/root/Test/Enemies").get_child_count()):
			if get_node("/root/Test/Player").get_position().distance_to(get_node("/root/Test/Enemies").get_child(i).get_position()) < distance:
				if not $Action.is_playing():
					$Calm._set_playing(false)
			else:
				if not $Calm.is_playing():
					$Calm._set_playing(true)
#	pass
