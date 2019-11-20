extends Button

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(0 , (value - 90) * 0.6)
	pass # Replace with function body.