extends Polygon2D

export var text = "Help"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.set_text(text)
	pass # Replace with function body.

func pop_up():
	$AnimationPlayer.play("CloseUp")

func close_up():
	$AnimationPlayer.play("CloseUp")

