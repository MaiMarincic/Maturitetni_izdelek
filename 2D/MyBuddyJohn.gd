#THE ZOMBIE GUY; PROB NOT GONNA BE USED IN THE FINAL PRODUCT MATURA VEGOVA MAI MAR


extends KinematicBody

const MOVE_SPEED = 4
const MOUSE_SENS = 0.5

onready var anim_player = $AnimationPlayer
onready var raycast = $RayCast

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	yield(get_tree(), "idle_frame")
	get_tree().call_group("Target", "set_MyBuddyJohn", self)

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= MOUSE_SENS * event.relative.x

func _process(delta):
	if Input.is_action_pressed("exit(3D)"):
		get_tree().quit()
	if Input.is_action_pressed("restart(3D)"):
		kill()

func _physics_process(delta):
	var move_vec = Vector3()
	if Input.is_action_pressed("move_forwards(3D)"):
		move_vec.z -= 1
	if Input.is_action_pressed("move_backwards(3D)"):
		move_vec.z += 1
	if Input.is_action_pressed("move_left(3D)"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right(3D)"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation.y)
	move_and_collide(move_vec * MOVE_SPEED * delta)
	
	if Input.is_action_pressed("shoot(3D)") and !anim_player.is_playing():
		anim_player.play("Shooting")
		var coll = raycast.get_collider()
		if raycast.is_colliding() and coll.has_method("kill"):
			coll.kill()

func kill():
	get_tree().reload_current_scene()