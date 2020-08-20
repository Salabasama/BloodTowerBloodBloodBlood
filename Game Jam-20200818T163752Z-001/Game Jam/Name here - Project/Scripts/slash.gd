extends KinematicBody2D

var lifespan = 10
var direction = Vector2(0,0)

func _process(delta):
	lifespan -= 1
	if lifespan <= 0:
		queue_free()
	
	var collision_info = move_and_collide(direction)
	if collision_info:
		if collision_info.collider.has_method("hit_with_slash"):
			collision_info.collider.call("hit_with_slash") #call hit_by_bullet method in collider
