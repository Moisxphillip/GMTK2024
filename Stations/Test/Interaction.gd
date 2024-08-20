extends Area3D

@onready var animation = $Animation
var isClose = false
var playerReference = null
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Off")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Interact") and isClose:
		$Display.show()
		$SubViewport/TestStationUI.IsInteracting = true
		$SubViewport/TestStationUI.applicationReference = playerReference.applicationReference
		$SubViewport/TestStationUI.playerReference = playerReference
		Application.placed = Application.PLACED.TEST
		playerReference.drop_item()
		playerReference.isLockedOnAction = true
	if  $SubViewport/TestStationUI.IsInteracting:
		animation.play("Off")


func _on_body_entered(_body):
	if _body.is_in_group("player") and Application.placed == Application.PLACED.PLAYER:
		animation.play("On")
		isClose = true
		playerReference = _body

func _on_body_exited(_body):
	isClose = false
	playerReference = null
	animation.play("Off")
