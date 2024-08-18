extends CharacterBody3D


const SPEED = 2.0
const JUMP_VELOCITY = 4.5

var isHoldingApplication = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var animation = $Animation

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
    if direction:
        velocity.x = direction.x * SPEED
        velocity.z = direction.z * SPEED
        if abs(direction.x) > abs(direction.z):
            if direction.x > 0:
                animation.play("Right")
                $HandRemoteTransform.position = Vector3(0.04,-0.08,0)
            else:
                animation.play("Left")
                $HandRemoteTransform.position = Vector3(-0.04,-0.08,-0.05)
        else:
            if direction.z > 0:
                animation.play("Down")
                $HandRemoteTransform.position = Vector3(0.04,-0.08,0)
            else:
                animation.play("Up")
                $HandRemoteTransform.position = Vector3(-0.04,-0.08,-0.05)
    else:
        
        if animation.current_animation.length() > 0 && animation.current_animation.length() <= 5:
            animation.play("Idle"+animation.current_animation)
        velocity.x = move_toward(velocity.x, 0, SPEED)
        velocity.z = move_toward(velocity.z, 0, SPEED)

    move_and_slide()
