extends Node2D

var speed = 50
var rage = 300
var hook = false
var area = Vector2(0,0)
var have = true
var enable = false
var ammo = 0
var ammo_max = 0

func update_text():
	if have:
		get_parent().get_node("Label").set_text("infi/infi")

func reload():
	pass