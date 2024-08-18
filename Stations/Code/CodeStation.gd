extends Node3D

var applicationReference = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$CodeStationDisplay.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("player"):
		applicationReference = body.get_node("Application")
	if applicationReference != null:
		$CodeStationDisplay.show();

func _on_body_exited(body):
	if body.is_in_group("player"):
		if applicationReference == null:
			$CodeStationDisplay.hide()
