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
		$SubViewport/CodeStationUI.IsInteracting = true
		$SubViewport/CodeStationUI.applicationReference = playerReference.applicationReference
		$SubViewport/CodeStationUI.playerReference = playerReference
		playerReference.drop_item()
		playerReference.isLockedOnAction = true
	if  $SubViewport/CodeStationUI.IsInteracting:
		animation.play("Off")


func _on_body_entered(_body):
	if _body.is_in_group("player") and _body.isHoldingApplication:
		animation.play("On")
		isClose = true
		playerReference = _body
	


func _on_body_exited(_body):
	isClose = false
	playerReference = null
	animation.play("Off")
