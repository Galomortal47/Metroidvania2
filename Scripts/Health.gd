extends Node2D

export var health_max = 20.0
export var health = 20.0
var invicible = false
var size = 20
var knockback = Vector2(0,-200)
export var invicility = false
export var player = false
export var time = 1.0

func _ready():
	get_node("Invicibility timer").set_speed_scale(time)

#func _ready():
#	get_parent().get_node("Save").loader()
#	get_parent().get_node("Save").save()
#	health = get_parent().get_node("Save").data.hp

func _process(delta):
	if health <= health_max * 0.25:
		$Line2D4.default_color = (Color(1,0,0))
	else:
		$Line2D4.default_color = (Color(1,1,1))
	if health > health_max:
		health = health_max
	$Label.set_text(str(int(health)) + "/" + str(health_max))
#	$Line2D4.set_scale(Vector2(float(health)/float(health_max),1))
	$Line2D4.set_points([Vector2(20,-35), Vector2((85*float(health)/float(health_max))+20,-35)])

func damage(var damage):
	if invicible == false:
		if get_parent().has_node("Camera2D"):
			get_parent().get_node("Camera2D").shake += 50
		get_parent().stun()
		health -= damage
		if player:
			$"Damage Number".play("Damage")
			$AudioStreamPlayer.play()
		$Label2.set_text(str(-damage))
	invici()
	
func invici():
	invicible = true
	get_node("Invicibility timer").set_current_animation("invicible")

func _on_Invicibility_timer_animation_finished(anim_name):
	invicible = false
	pass # Replace with function body.
