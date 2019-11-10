extends Sprite
# var a = 2
# var b = "text"
export var offset2 =270
export var size = Vector2( 960, 540)
var player
var save = preload("res://Scripts/Save.gd").new()
var enable = true

# Called when the node enters the scene tree for the first time.
func _ready():
	save()
	player = "/root/Test/Player"
	if enable:
		size = Vector2( 960, 540)
		var image = get_viewport().get_texture()
		set_texture(image) 

func _process(delta):
	if has_node(player) and enable:
		set_region_rect(Rect2(-get_node(player).get_global_position().x+ get_global_position().x  ,get_node(player).get_global_position().y-get_global_position().y+offset2,size.x,size.y))
#	pass

func save():
	save.loader()
	match save.data.graphics:
		"fancy":
			enable = true
		"fast":
			enable = false
	pass # Replace with function body.