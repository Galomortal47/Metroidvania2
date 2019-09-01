extends Node2D

export var health_max = 20
export var health = 20
var invicible= false
var size = 20
var knockback = Vector2(0,-200)
export var invicility = false
export var player = false

func _process(delta):
	if health <= health_max * 0.25:
		$Line2D3.default_color = (Color(1,0,0))
	else:
		$Line2D3.default_color = (Color(1,1,1))
	if health > health_max:
		health = health_max
	$Label.set_text(str(health) + "/" + str(health_max))
	$Line2D3.set_scale(Vector2(float(health)/float(health_max),1))

func damage(var damage):
	if invicible == false:
		if get_parent().has_node("Camera2D"):
			get_parent().get_node("Camera2D").shake += 50
		get_parent().stun()
		health -= damage
		if player:
			$"Damage Number".play("Damage")
			$AudioStreamPlayer._set_playing(true)
		$Label2.set_text(str(-damage))
	invici()
	
func invici():
	if invicility:
		invicible = true
	get_node("Invicibility timer").set_current_animation("invicible")

func _on_Invicibility_timer_animation_finished(anim_name):
	invicible = false
	pass # Replace with function body.
