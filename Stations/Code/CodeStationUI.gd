extends Control

var IsInteracting = false
@onready var CodeStation = get_node("../../../../CodeStation")
@onready var Player = get_node("../../../../Player")
var application = null


# Called when the node enters the scene tree for the first time.
func _ready():
	$CodeStationUI/StopButton.hide()
	$CodeStationUI/LabelCodingState.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	application = CodeStation.applicationReference
	

	
func executeCode():
	pass

func _on_code_button_pressed():
	$CodeStationUI/CodeButton.hide()
	$CodeStationUI/LabelCodingState.show()
	$CodeStationUI/StopButton.show()
	
	

	Player.get_node("HandRemoteTransform").remote_path = ""
	#Scenario.Application.position = Vector3(0,0,0)

func _on_stop_button_pressed():
	$CodeStationUI/CodeButton.show()
	$CodeStationUI/LabelCodingState.hide()
	$CodeStationUI/StopButton.hide()

func _on_build_button_pressed():
	Player.get_node("HandRemoteTransform").remote_path = "../../Application"
		
