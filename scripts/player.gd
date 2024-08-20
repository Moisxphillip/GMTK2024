extends CharacterBody3D


const SPEED = 2.0
const JUMP_VELOCITY = 4.5

var isHoldingApplication = true
var isLockedOnAction = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var animation = $Animation
@onready var applicationReference = $"../Application"

func _process(delta):
	if Application.placed == Application.PLACED.PLAYER:
		take_item()
		$"../Application".show()


func _physics_process(_delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y -= gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction and not isLockedOnAction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if abs(direction.x) > abs(direction.z):
			if direction.x > 0:
				animation.play("Right")
				
			else:
				animation.play("Left")
			
		else:
			if direction.z > 0:
				animation.play("Down")

			else:
				animation.play("Up")
				
	else:
		
		if animation.current_animation.length() > 0 && animation.current_animation.length() <= 5:
			animation.play("Idle"+animation.current_animation)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func drop_item():
	isHoldingApplication = false
	$HandRemoteTransform.remote_path = ""
	
func take_item():
	isHoldingApplication = true
	$HandRemoteTransform.remote_path = "../../Application"
	
