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
	$DeployStationUI/ProgressBar.hide()
	$DEPLOY.hide()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if IsInteracting == true:
		IsInteracting = false
		is_building = true
		elapsed_time = 0
		$DeployStationUI/ProgressBar.show()
		$DEPLOY.show()
	if is_building:
		elapsed_time += _delta
		$DeployStationUI/ProgressBar.value = elapsed_time/time_to_deploy * 100
		if elapsed_time >= time_to_deploy:
			Application.placed = Application.PLACED.PLAYER
			is_building = false
			deploy_application()
			$DeployStationUI/ProgressBar.hide()
			$DEPLOY.hide()
			#deploy no servidor

func deploy_application():
	$"../../../../ServerController".deploy_application()
		
