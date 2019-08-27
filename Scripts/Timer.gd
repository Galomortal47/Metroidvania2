extends Label

var time = 720

func _process(delta):
	var hour = int(time/60)
	var mins = int(time) - (hour *60)
	if hour > 23:
		time = 0
	if mins >= 10:
		set_text(str(hour)+":"+str(mins))
	else:
		set_text(str(hour)+":0"+str(mins))
	
	time += delta
#	pass
