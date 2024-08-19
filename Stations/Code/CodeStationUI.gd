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
	$"../../Display".hide()
	$CodeStationUI/Particles.emitting = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	elapsed_time += _delta
	if IsInteracting and applicationReference != null:
		if Input.is_action_just_pressed("Complete"):
			playerReference.isLockedOnAction = false
			playerReference.take_item()
			$CodeStationUI/ProgressBar.show()
			animation.play("load")
			IsInteracting = false
			$CodeStationUI/Particles.emitting = false
			$"../../Display".hide()
		else:
			$CodeStationUI/Particles.emitting = true
			executeCode()
	
func executeCode():
	if applicationReference != null:
		if last_produced + code_value_interval <= elapsed_time:
			last_produced = elapsed_time
			applicationReference.increaseCodeValue()
		
	

		
