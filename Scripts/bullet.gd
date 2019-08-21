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

func _ready():
	motion.y += curve
	$CPUParticles2D.scale_amount = particle_size
	$CPUParticles2D2.scale_amount = particle_size

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
		if not $bullet.get_collider().is_in_group(ignore):
			$CPUParticles2D2.emitting = true
		if $bullet.get_collider().is_in_group(target):
			if $bullet.get_collider().has_node("Health"):
				$bullet.get_collider().get_node("Health").health -= damage
				if not pierce:
					queue_free()
