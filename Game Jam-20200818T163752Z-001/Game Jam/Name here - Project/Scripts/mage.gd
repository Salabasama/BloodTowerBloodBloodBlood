extends KinematicBody2D

var fireball = preload("res://Scene/fireball.tscn") #This is a "sword swing".
var fireballdelay = 30
var blastin = false #tells the mage to be shooting or not shooting.
var target #This'll hold the player when he sees them.

var speed : int = 200
var gravity : int = 800

var vel : Vector2 = Vector2()
onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	vel.x = 0
	
	
	# movementinputs
	#if player is too close:
	#	vel.x -= speed
	#if Input.is_action_pressed("move_right"):
	#	vel.x += speed
		
		# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	#gravity
	vel.y += gravity*delta
#remove the "#" above to apply gravityaaa

	#attackinput
	if blastin == true && fireballdelay >= 30: #Slashdelay determines how fast the player can attack.  Changing it here will control that.  Lower is faster.  Yes, I just copied the bullet script from my jet game.
		var fireballinstance = fireball.instance() #Create the slash and grab its instance ID.
		var spawn = Vector2(10,10) #Find the spawn location of the slash, 16 pixels ahead of the player.  It's in the palyer's coordinates, so it starts from the origin.
		fireballinstance.position = spawn
		fireballinstance.initial_heading = get_angle_to(target.position)
		get_node(".").add_child(fireballinstance)
		fireballdelay = 0
	
	fireballdelay += 1

func _on_Vision_body_entered(body):
	if "Player" in body.name:
		blastin = true
		target = body #Can probably grab the player node another way but this is easy.


func _on_Vision_body_exited(body):
		blastin = false

func _hit_with_slash(): #If the mage runs this function, he dies.  The function is called from the Slash scene.
	queue_free()


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
