extends KinematicBody2D

var angle = 0.0
var motion = Vector2(0,0)
var speed = 20
var max_speed = 200
var gravity = 10
var jump = 0
var drag = 0.9
export var damage = 5
export var health = 20
var stun = false
var boltspawner = preload("bolt_spawner.gd").new()
var attack = Vector2(60,0)
var timer = 3
var time_aux= 3
export var type = "melee"
export var bolts_spwned_upon_death = 5
var start = true
var first = false
var followtrough = 1

func _ready():
	$Health.health_max = health

func _process(delta):
	if not $Ground_Detect.is_colliding():
		motion.y += gravity
	match type:
		"melee":
			hunt_player(60)
			damage()
		"shooter":
			timer -= delta
			shot_player()
	die()
	motion = move_and_slide(motion)

#ar dano ao encostar no jgador
func damage():
	if $Damage.is_colliding():
		if $Damage.get_collider().is_in_group("player"):
		 $Scale/Body/AnimationPlayer2.play("attack")

func shot_player():
	if $Vision.is_colliding():
		if $Vision.get_collider().is_in_group("player") and timer-followtrough < 0:
			$Timer.start()
		if $Vision.get_collider().is_in_group("player") and timer < 0:
			$Polygon2D2.show()
			$Vision.rotate(get_angle_to($Vision.get_collider().get_position()) - $Vision.get_rotation() -1.57)
			var bullet = load("res://assets/Bullet.tscn")
			var bullet_instance = bullet.instance()
			bullet_instance.set_rotation(get_angle_to($Vision.get_collider().get_position()) )
			bullet_instance.ignore = "enemy"
			bullet_instance.target = "player"
			bullet_instance.speed = 175
			bullet_instance.lifespan = 10
			bullet_instance.get_node("CPUParticles2D").set_color(Color(1,0,0))
			bullet_instance.set_position(get_global_position())
			get_tree().get_root().add_child(bullet_instance)
			timer = time_aux

#virar raycast em direçao ao jogador se mover ate ele
func hunt_player(var distance):
	$Damage.set_cast_to(attack)
	if $Vision.is_colliding():
		if $Vision.get_collider().is_in_group("player"):
			if get_position().distance_to($Vision.get_collider().get_position()) > distance:
				$Vision.rotate(get_angle_to($Vision.get_collider().get_position()) - $Vision.get_rotation() - 1.57)
				if $Vision.get_collider().get_position().x - get_position().x > 0:
					if motion.x < max_speed:
						motion.x += speed
					attack.x = 60
				elif $Vision.get_collider().get_position().x - get_position().x < 0:
					if motion.x > -max_speed:
						motion.x -= speed
					attack.x = -60
				if $Vision.get_collider().get_position().y - get_position().y < -30:
					attack.y = -60
					motion.y = -jump
				elif $Vision.get_collider().get_position().y - get_position().y > 30:
					attack.y = 60
				else:
					attack.y = 0
	else:
		motion.x *= drag

#mudar a direçao do raycasyt na direçao do jogador

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	angle = get_angle_to(body.get_position()) -1.57
	$Vision.rotate(angle - $Vision.get_rotation())
	pass # Replace with function body.

func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	angle = get_angle_to(body.get_position()) -1.57
	$Vision.rotate(angle - $Vision.get_rotation())
	pass # Replace with function body.

# verifica a vida do inimigo e o destruir caso ela seja igual ou menor que 0
func die():
	if get_node("Health").health <= 0:
		boltspawner.bolt_spawn(bolts_spwned_upon_death,get_tree().get_root(),get_position())
		boltspawner.particle_spawn(get_tree().get_root(),get_position())
		queue_free()
		

func stun():
	if motion.x > 0:
		motion += Vector2(-500,0)
	else:
		motion += Vector2(500,0)

func attack():
	if $Damage.is_colliding():
		if $Damage.get_collider().has_node("Health"):
			$Damage.get_collider().get_node("Health").damage(damage)

func _on_Timer_timeout():
	$Polygon2D2.hide()
	pass # Replace with function body.
