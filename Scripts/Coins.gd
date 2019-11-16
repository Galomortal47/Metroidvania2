extends CanvasLayer

var before = 0

func _ready():
	get_parent().get_node("Save").loader()
	$Number.set_text(str(int(get_parent().get_node("Save").data.money)))
	before = int($Number.get_text())
	pass # Replace with function body.

func _physics_process(delta):
	$Label2.set_text("+"+str(int($Number.get_text())-before))

func _on_AnimationPlayer_animation_finished(anim_name):
	before = int($Number.get_text())
	pass # Replace with function body.
