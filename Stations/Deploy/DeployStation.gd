extends Node3D

var applicationReference = null

# Called when the node enters the scene tree for the first time.
func _ready():
    $DeployStationDisplay.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass

func _on_stage_area_body_entered(_body):
    $DeployStationDisplay.show();
        


func _on_stage_area_body_exited(_body):
    $DeployStationDisplay.hide()
        
        
