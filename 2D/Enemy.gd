extends KinematicBody2D

const GRAVITY = 20
const MAX_SPEED = 150

const UP = Vector2(0, -1)
var motion = Vector2()

var left = false
var right = true
var directionWasChanged = false

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if is_on_wall():
		directionWasChanged = true
		if right == true:
			right = false
			left = true
		else:
			right = true
			left = false
	else:
		directionWasChanged = false
		if right == true:
			motion.x = MAX_SPEED
			$Sprite.flip_h = false
			$Sprite.play("Run")
		else:
			motion.x = -MAX_SPEED
			$Sprite.flip_h = true
			$Sprite.play("Run")
	
	motion = move_and_slide(motion, UP)
	
	pass