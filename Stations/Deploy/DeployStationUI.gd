extends Control

@export var time_to_deploy:float = 2

var IsInteracting = false
var applicationReference = null
var playerReference = null
var elapsed_time: float = 0
var last_produced = 0

var is_building = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$"../../Display".hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if IsInteracting == true:
		IsInteracting = false
		is_building = true
		elapsed_time = 0
	if is_building:
		elapsed_time += _delta
		$TestStationUI/ProgressBar.value = elapsed_time/time_to_deploy * 100
		if elapsed_time >= time_to_deploy:
			playerReference.take_item()
			is_building = false
			$"../../Display".hide()
			#deploy no servidor

func deploy_application():
	pass
		
