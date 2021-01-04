extends Node

func _ready():
	if get_node("/root/Global").map == 0:
		$LvL1.queue_free()
	elif get_node("/root/Global").map == 1:
		$LvL1.queue_free()
		$LvL2.queue_free() 
	elif get_node("/root/Global").map == 2:
		$LvL1.queue_free()
		$LvL2.queue_free() 
		$LvL3.queue_free()
	elif get_node("/root/Global").map == 3:
		$LvL1.queue_free()
		$LvL2.queue_free() 
		$LvL3.queue_free()
		$LvL4.queue_free()
	pass