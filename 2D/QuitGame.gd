extends Area2D

func _physics_process(delta):
	var overlappingBodies = get_overlapping_bodies()
	
	for overlappingBody in overlappingBodies:
		if overlappingBody.name == "Player":
			get_tree().quit_game()
	pass