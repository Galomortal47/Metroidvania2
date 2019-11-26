extends KinematicBody2D

export var vida = 1
export var mult = 0
export var crown = false
#var fireball = load("res://Resources/fireball.tscn")
var able = false
var boltspawner = preload("boltspawner.gd").new()

func _ready():
	get_node("Health").set_scale(get_scale()*Vector2(4,4))
	if crown == true:
		get_node("Root/stem1/stem2/stem3/stem4/stem5/Mouth Top/crown").show()
#		able = true
	else:
		get_node("Root/stem1/stem2/stem3/stem4/stem5/Mouth Top/crown").hide()
#	get_node("Root/stem1/stem2/stem3/stem4/stem5/Jumpers").multiplier = mult
func _process(delta):
	if $"player detection2".is_colliding():
		print("col")
		set_scale(get_scale()*Vector2(-1,1))
	attack()
	death()
	if get_node("player detection").is_colliding():
		if not vida == 0:
			get_node("AnimationPlayer").set_current_animation("attack")

func death():
	if $Health.health < 1:
		get_node("AnimationPlayer2").play("death")

#func _on_Spawn_Fireball_timeout():
#	if able:
#		var bomb = fireball.instance()
#		var pos = get_node("Root/stem1/stem2/stem3/stem4/stem5/Mouth Top/crown").get_global_position()
#		bomb.set_position(pos)
#		get_parent().add_child(bomb)
#	pass # Replace with function body.

export var target = "player"
export var damage = 1

func attack():
	var Damage = get_node("Root/stem1/stem2/stem3/stem4/stem5/Damage")
	if Damage.is_colliding():
		if Damage.get_collider().is_in_group(target):
			if Damage.get_collider().has_node("Health"):
				Damage.get_collider().get_node("Health").damage(damage)

export var bolts_spwned_upon_death = 5

func dead():
	boltspawner.bolt_spawn(bolts_spwned_upon_death,get_tree().get_root(),get_position())
	boltspawner.particle_spawn(get_tree().get_root(),get_position())
	queue_free()

func stun():
	pass