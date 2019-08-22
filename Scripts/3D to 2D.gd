extends Sprite

func _ready():
	var text = get_parent().get_node("Viewport").get_texture()
	self.texture = text
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
