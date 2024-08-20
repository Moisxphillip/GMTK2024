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
	$TestStationUI/Particles.emitting = false
	$TestStationUI/ProgressBar.hide()
	$RELEASE.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	elapsed_time += _delta
	
	if IsInteracting and Application.placed == Application.PLACED.TEST:
		
		if Input.is_action_just_pressed("Complete"):
			playerReference.isLockedOnAction = false
			IsInteracting = false
			Application.placed = Application.PLACED.PLAYER
			$TestStationUI/Particles.emitting = false
			$RELEASE.hide()
			$TestStationUI/ProgressBar.hide()
		else:
			$TestStationUI/Particles.emitting = true
			$TestStationUI/ProgressBar.show()
			executeTest()
			$RELEASE.show()
	
func executeTest():
	if Application.placed == Application.PLACED.TEST:
		if last_produced + test_value_interval <= elapsed_time:
			last_produced = elapsed_time
			Application.increaseCodeQuality()
			print(Application.avg_code_quality_percentage)
			$TestStationUI/ProgressBar.value = Application.avg_code_quality_percentage*100
		
	

		
