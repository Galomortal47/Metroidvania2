extends Polygon2D
var open = false
export var text = "Help"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.set_text(text)
	pass # Replace with function body.
	
func _input(event):
	if Input.is_action_just_pressed("ui_roll") and open:
		$AnimationPlayer.play("CloseUp")

func pop_up():
	$AnimationPlayer.play("PopUp")
	open = true


func close_up():
	open = true

