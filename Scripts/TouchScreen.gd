extends CanvasLayer

func _ready():
	if OS.get_name() == "Windows" or OS.get_name() == "Linux":
		$Controls.hide()
	pass # Replace with function body.
