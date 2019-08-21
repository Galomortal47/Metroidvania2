extends Sprite
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var image = get_viewport().get_texture()
	set_texture(image) 

func _process(delta):
	if get_parent().has_node("Player"):
		set_region_rect(Rect2(-get_parent().get_node("Player").get_global_position().x+get_global_position().x  ,get_parent().get_node("Player").get_global_position().y-get_global_position().y+235,1024,500))
#	pass
