extends Sprite

export var material_fancy = preload("res://assets/Tiles/watershader.tres")
export var material_fast =  preload("res://assets/Tiles/watershaderfast.tres")

var save = preload("res://Scripts/Save.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	save()
	pass # Replace with function body.
#
#func _process(delta):
#	var size = Vector2(32 * get_scale().x * 2,32 * get_scale().y * 2)
#	var pos = get_global_position() - get_parent().get_node("Player").get_global_position()
#	var mouse_pos = Vector2(pos .y / size.y ,-pos .x / size.x)
#	get_material().set_shader_param("input",mouse_pos)

func save():
	save.loader()
	match save.data.graphics:
		"fancy":
			material = material_fancy
		"fast":
			material = material_fast
	pass # Replace with function body.