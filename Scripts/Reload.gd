extends Label

var menu_size = 8

func reload():
	for i in range(0,menu_size):
		if get_parent().get_child(i).enable:
			get_parent().get_child(i).reload()
			get_parent().get_child(i).update_text()
