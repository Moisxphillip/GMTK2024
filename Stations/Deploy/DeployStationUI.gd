extends Control

@onready var DeployStation = get_node("../../../../DeployStation")
@onready var Player = get_node("../../../../Player")
@export var progress_rate = 10
var loading = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$DeployStationUI/ProgressBar.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if loading:
		$DeployStationUI/ProgressBar.value += delta*progress_rate
		if $DeployStationUI/ProgressBar.value >= 100:
			$DeployStationUI/DeployButton.show()
			$DeployStationUI/ProgressBar.hide()
			$DeployStationUI/ProgressBar.value = 0
			loading = false
			

func _on_deploy_button_pressed():
	$DeployStationUI/DeployButton.hide()
	$DeployStationUI/ProgressBar.show()
	
	$DeployStationUI/ProgressBar.value = 0
	loading = true
