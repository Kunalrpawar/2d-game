extends CharacterBody2D


const SPEED = 250.0  # Reduced speed
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("Idle")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	print(direction)

	if direction == -1:
		anim.flip_h = true
	else:
		anim.flip_h = false

	if direction != 0:
		velocity.x = direction * SPEED
		anim.play("Run")
	else:
		anim.play("Idle")
		velocity.x = 0  # Remove sliding by setting velocity.x to 0

	# Move the character and handle collisions.
	move_and_slide()
	if Game.playerHP <=0:
		queue_free()
		get_tree().change_scene_to_file("res://main.tscn")
		
		
