extends RigidBody2D

var lifespan = 100

func _process(delta):
	lifespan -= 1
	if lifespan <= 0:
		queue_free()


func _on_Area2D_body_entered(body):
	if "mage" in body.name:
		queue_free()

	if "TileMap" in body.name:
		queue_free()

	if "TileMap3" in body.name:
		queue_free()

	if "TileMap2" in body.name:
		queue_free()

	if "TileMap3" in body.name:
		queue_free()
