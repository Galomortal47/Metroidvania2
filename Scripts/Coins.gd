extends CanvasLayer

func _ready():
	get_parent().get_node("Save").loader()
	$Number.set_text(str(int(get_parent().get_node("Save").data.money)))
	pass # Replace with function body.
