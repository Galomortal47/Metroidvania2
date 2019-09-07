extends AnimationPlayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var save = preload("res://Scripts/Save.gd").new()
export var cuscene_id = 0
export var autoplay2 = true
# Called when the node enters the scene tree for the first time.
func _ready():
	save.loader()
	if save.data.cutscenes[cuscene_id] and autoplay2:
		play(str(cuscene_id))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_CutScene_animation_finished(anim_name):
	save.data.cutscenes[int(anim_name)] = false
	save.save()
	pass # Replace with function body.
