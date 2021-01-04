extends Area2D

export(String, FILE, "*.tscn") var next_world

func _physics_process(delta):
	var overlappingBodies = get_overlapping_bodies()
	
	for overlappingBody in overlappingBodies:
		if overlappingBody.name == "Player":
			get_tree().change_scene(next_world)
	pass
