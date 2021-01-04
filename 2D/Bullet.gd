extends Area2D

export (int) var speed
export (int) var lifetime

var velocity = Vector2()

func start(_position, _direction):
	position = _position
	rotation = _direction.angle()
	$Lifetime.wait_time = lifetime
	velocity = _direction * speed
	
func _process(delta):
	position += velocity * delta
	
func explode():
	queue_free()
	
func _onBulletHit(body):
	if body.has_method("take_damage"):
		body.takeDamage(damage)
	
func _onBulletTimeout():
	explode()
