extends KinematicBody2D

var damage = 5
var motion = Vector2(0,0)
var speed = 500
var gravity = 0
var curve = 0
var lifespan = 1.0
var particle_size = 15
var pierce = false
var ignore = "player"
var target = "enemy"
var explosion = false
var explosive = preload("res://Scripts/explosion.gd").new()
var explosion_color = Color(1,0,0)

func _ready():
	motion.y += curve
	$CPUParticles2D.scale_amount = particle_size

func _process(delta):
	attack()
	var dir = Vector2(cos(get_rotation()), sin(get_rotation()))
	set_position(get_position() + dir * (speed * delta))
	motion.y += gravity
	motion = move_and_slide(motion)
	lifespan -= delta
	if lifespan < 0:
		queue_free()

func attack():
	if $bullet.is_colliding():
		if $bullet.get_collider().is_in_group(target) or $bullet.get_collider().is_in_group("destroy"):
			if not $bullet.get_collider().get_node("Health").invicible:
					$bullet.get_collider().get_node("Health").damage(damage)
			else:
				$bullet.get_collider().get_node("Health").damage(0)
			if explosion:
				explosive.explosion(get_global_position(),get_tree().get_root(),"enemy","player", damage,explosion_color)
			if not pierce:
				queue_free()
