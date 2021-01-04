extends CollisionShape2D

func _physics_process(delta):
	var overlappingBodies = get_overlapping_bodies()
	
	print(overlappingBodies)
	
	for overlappingBody in overlappingBodies:
		if overlappingBody.name == "Enemy":
			get_tree().change_scene("res://Lobby.tscn")
	pass
