extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var minigame = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if minigame:
			get_parent().get_node("Weapons/Label").reload()
			$Minigame.set_current_animation("Succes")
			minigame = false
		elif $Minigame.get_current_animation() == "Load":
			$Minigame.set_current_animation("Failure")
#	pass

func load_minigame():
	minigame = true
#	if Input.is_action_just_pressed("ui_cancel"):
#		$Minigame.advance(1)

func unload_minigame():
	minigame = false