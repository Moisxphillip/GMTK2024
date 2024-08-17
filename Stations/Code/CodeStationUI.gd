extends Control

var IsInteracting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$CodeStationUI/StopButton.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
func executeCode():
	pass


func _on_code_button_pressed():
	$CodeStationUI/CodeButton.hide()
	$CodeStationUI/StopButton.show()

func _on_stop_button_pressed():
	$CodeStationUI/CodeButton.show()
	$CodeStationUI/StopButton.hide()

func _on_build_button_pressed():
	pass # Replace with function body.
