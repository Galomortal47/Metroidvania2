extends Node

var money = 0
var pos
var health
var set =false

func _process(delta):
	print(money,pos,health)
	if has_node("/root/Test/Player/"):
		pos = get_node("/root/Test/Player").get_position()
		health = get_node("/root/Test/Player/Health").health
#		get_node("/root/Test/Coins/Number").set_text(str(money))
#		if health <=0: 
		money = int(get_node("/root/Test/Coins/Number").get_text())
#	pass
