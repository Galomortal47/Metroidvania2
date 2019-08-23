extends Sprite
# var a = 2
# var b = "text"
export var swin = true
export var offset2 = 135
export var size = Vector2( 960, 540)
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	size = Vector2( 960, 540)
	player = "/root/Test/Player"
	$Swimming.swin = swin
	var image = get_viewport().get_texture()
	set_texture(image) 

func _process(delta):
	if has_node(player):
		set_region_rect(Rect2(-get_node(player).get_global_position().x+ get_global_position().x  ,get_node(player).get_global_position().y-get_global_position().y+offset2,size.x,size.y))
#	pass
