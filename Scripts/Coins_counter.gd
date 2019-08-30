extends CanvasLayer

var current
var before
var timer = 1.0
var timer_aux = 1.0

func _process(delta):
	$Label2.set_text(str(int($Number.get_text())-current))

func _on_Timer_timeout():
	before = int($Number.get_text())
	pass # Replace with function body.
