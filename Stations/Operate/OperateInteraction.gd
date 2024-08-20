extends Area3D

@onready var animation = $Animation
var isClose = false
var playerReference = null

func _ready():
	animation.play("Off")

func _process(_delta):
	if Input.is_action_just_pressed("Interact") and isClose:
		$"../../Store".show()
		playerReference.drop_item()
		playerReference.isLockedOnAction = true

func _on_body_entered(_body):
	if _body.is_in_group("player") and _body.isHoldingApplication:
		animation.play("On")
		isClose = true
		playerReference = _body

func _on_body_exited(_body):
	isClose = false
	playerReference = null
	animation.play("Off")
