extends CanvasLayer

func _ready():
	if OS.get_name() == "Windows":
		$Controls.hide()
	pass # Replace with function body.
