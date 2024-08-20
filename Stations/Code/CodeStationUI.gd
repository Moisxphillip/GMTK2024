extends Control

var IsInteracting = false
var applicationReference = null
var playerReference = null
@export var building_time: float
@export var code_value_interval: float = 1
@onready var animation = $CodeStationUI/Animation
var elapsed_time: float = 0
var last_produced = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$CodeStationUI/Particles.emitting = false
	$CodeStationUI/BUILD.hide()
	$CodeStationUI/ProgressBar.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	elapsed_time += _delta
	$CodeStationUI/ProgressBar.value = Application.code_progress 
	if IsInteracting and Application.placed == Application.PLACED.CODE:
		$CodeStationUI/ProgressBar.show()
		$CodeStationUI/BUILD.show()
		if Input.is_action_just_pressed("Complete"):
			playerReference.isLockedOnAction = false
			Application.placed = Application.PLACED.PLAYER
			IsInteracting = false
			$CodeStationUI/Particles.emitting = false
			$CodeStationUI/BUILD.hide()
			$CodeStationUI/ProgressBar.hide()
		else:
			$CodeStationUI/Particles.emitting = true
			executeCode()
	
func executeCode():
	if Application.placed == Application.PLACED.CODE:
		if last_produced + code_value_interval <= elapsed_time:
			last_produced = elapsed_time
			Application.increaseCodeValue()
		
	

		
