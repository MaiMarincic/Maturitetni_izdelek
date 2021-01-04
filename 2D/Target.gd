extends KinematicBody
 
const MOVE_SPEED = 3
 
onready var raycast = $RayCast
onready var anim_player = $AnimationPlayer
 
var MyBuddyJhon = null
var dead = false
 
func _ready():
    anim_player.play("Target_walk")
    add_to_group("Target")
 
func _physics_process(delta):
    if dead:
        return
    if MyBuddyJhon == null:
        return
   
    var vec_to_MyBuddyJhon = MyBuddyJhon.translation - translation
    vec_to_MyBuddyJhon = vec_to_MyBuddyJhon.normalized()
    raycast.cast_to = vec_to_MyBuddyJhon * 1.5
   
    move_and_collide(vec_to_MyBuddyJhon * MOVE_SPEED * delta)
   
    if raycast.is_colliding():
        var coll = raycast.get_collider()
        if coll != null and coll.name == "MyBuddyJohn":
            coll.kill()
   
 
func kill():
    dead = true
    $CollisionShape.disabled = true
    anim_player.play("Target_die")
 
func set_MyBuddyJhon(p):
    MyBuddyJhon = p