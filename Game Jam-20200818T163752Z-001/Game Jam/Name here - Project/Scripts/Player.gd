extends KinematicBody2D

var slash = preload("res://Scene/slash.tscn") #This is a "sword swing".
var slashdelay = 10

var speed : int = 200
var jumpForce : int = 475
var gravity : int = 800
var facing = 16 #tells game where to put the sword slash
var playerloc

var vel : Vector2 = Vector2()
onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	vel.x = 0
	
	# movementinputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
		
		# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	#gravity
	vel.y += gravity*delta
#remove the "#" above to apply gravity

	#attackinput
	if Input.is_action_just_pressed("ui_accept") && slashdelay >= 10: #Slashdelay determines how fast the player can attack.  Changing it here will control that.  Lower is faster.  Yes, I just copied the bullet script from my jet game.
		var slashinstance = slash.instance() #Create the slash and grab its instance ID.
		var spawn = Vector2(0,0) #Find the spawn location of the slash, 16 pixels ahead of the player.  It's in the palyer's coordinates, so it starts from the origin.
		spawn.x += facing 
		slashinstance.position = spawn
		get_node(".").add_child(slashinstance)
		slashdelay = 0
	
	slashdelay += 1
	
	#jumpinput
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	#spritedirection
	if vel.x < 0: #sprite's symmetrical, so I repurposed this to tell us which way a weapon swings.
		facing = -16
	elif vel.x > 0:
		facing = 16
		

func _on_Area2D_body_entered(body):
	if "fireball" in body.name:
		get_tree().change_scene("res://Scene/Dead.tscn")
