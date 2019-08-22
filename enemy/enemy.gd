extends KinematicBody2D

var motion = Vector2(0,0)
export var speed = 30
export var desaceleration = 0
export var rotate_desaceleration = 0
export var max_speed = 300
export var vision = 160
export var vision_awaken = 600
var player = "/root/Node2D/Player"
var model3d = "Monster2D-3D/Viewport/Scene Root/Armature"
var animation = "Monster2D-3D/Viewport/Scene Root/AnimationPlayer"
var vision_original = 0
var rotatio = 0

func _ready():
	vision_original = vision

func _process(delta):
	if get_position().distance_to(get_node(player).get_position()) < vision:
		rotatio = self.get_angle_to(get_node(player).get_position())
		var angle = get_node(model3d).get_rotation().y
		get_node(model3d).set_rotation(Vector3(0,(0.5*(round((-rotatio - angle + 1.57)*2))),0))
		vision = vision_awaken
		get_node(animation).set_current_animation("ArmatureAction")
		if get_node(player).get_position().y < self.get_position().y:
			if not motion.y < -max_speed:
				motion.y -= speed
		elif get_node(player).get_position().y > self.get_position().y:
			if motion.y < max_speed:
				motion.y += speed
		else:
			motion.y *= desaceleration
		if get_node(player).get_position().x < self.get_position().x:
			if not motion.x < -max_speed:
				motion.x -= speed
		elif get_node(player).get_position().x > self.get_position().x:
			if motion.x < max_speed:
				motion.x += speed
		else:
			motion.x *= desaceleration
			
	else:
		motion *= desaceleration
		vision = vision_original
		get_node(animation).set_current_animation("sleep")
	
	motion = move_and_slide(motion,Vector2(0,0))
