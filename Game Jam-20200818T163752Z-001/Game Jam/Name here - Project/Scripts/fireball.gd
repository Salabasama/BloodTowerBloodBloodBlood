extends KinematicBody2D

#var initial_heading = Vector2() #Nevermind, I don't need so much trig.  This goes to the block in _ready.
const SPEED = 600
const UP = Vector2(0,-1)
var velocity = Vector2()
var initial_heading #Ok, don't know how to get shit from parents yet.  I'll just have the ship send it.
var lifespan = 100
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#var initial_heading = get_parent().rotation #The all new, not-calculated initial_heading variable.
	velocity.x = cos(initial_heading) * SPEED
	velocity.y = sin(initial_heading) * SPEED #Ok, now the bullet has been shit out knowing its starting vector of movement based on the facing of the player.
#	initial_heading = get_parent().velocity #Creodor pointed out that I don't need to do all this.  Goes with the #ed-out initial_heading variable up top.
#	var theta = atan2(initial_heading.y/initial_heading.x)
#	velocity.x = sin(theta) * SPEED
#	velocity.y = cos(theta) * SPEED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lifespan -= 1
	move_and_slide(velocity, UP)
	if lifespan <= 0:
		queue_free()


func _on_Area2D_body_entered(body):
	if "TileMap" in body.name:
		queue_free()

	if "TileMap3" in body.name:
		queue_free()

	if "TileMap2" in body.name:
		queue_free()

	if "TileMap3" in body.name:
		queue_free()
		
	if "Bullet" in body.name:
		queue_free()
