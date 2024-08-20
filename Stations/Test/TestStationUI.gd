extends Control

var IsInteracting = false
var applicationReference = null
var playerReference = null
@export var test_value_interval: float = 1
@onready var animation = $TestStationUI/Animation
var elapsed_time: float = 0
var last_produced = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$"../../Display".hide()
	$TestStationUI/Particles.emitting = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	elapsed_time += _delta
	
	if IsInteracting and applicationReference != null:
		if Input.is_action_just_pressed("Complete"):
			playerReference.isLockedOnAction = false
			playerReference.take_item()
			IsInteracting = false
			$TestStationUI/Particles.emitting = false
			$"../../Display".hide()
		else:
			$TestStationUI/Particles.emitting = true
			executeTest()
	
func executeTest():
	if applicationReference != null:
		if last_produced + test_value_interval <= elapsed_time:
			last_produced = elapsed_time
			applicationReference.increaseCodeQuality()
			$TestStationUI/ProgressBar.value = clamp(applicationReference.avg_code_quality_percentage * 100, 0 , 100)
		
	

		
