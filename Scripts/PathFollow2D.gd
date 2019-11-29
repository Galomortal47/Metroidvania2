extends PathFollow2D

export var velocidade = 1

func _physics_process(delta):
	set_offset(get_offset() + (velocidade+delta))
#	pass
