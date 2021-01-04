extends Area2D

func _ready():
	print (get_node("/root/Global").map)
	if get_parent("/root/Global").map == 0:
		#$LvL1.free()
		get_node("LvL1").free()
	elif get_parent("/root/Global").map == 1:
		LvL2.queue_free() 
	elif get_parent("/root/Global").map == 2:
		LvL3.queue_free() 
	elif get_parent("/root/Global").map == 3:
		LvL4.queue_free() 
	pass