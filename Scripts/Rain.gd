extends CanvasLayer

var rain_chance = 10000

func _process(delta):
	randomize()
	if 1 > rand_range(0,rain_chance):
		$CPUParticles2D.set_emitting(!$CPUParticles2D.is_emitting())
		
#	pass
