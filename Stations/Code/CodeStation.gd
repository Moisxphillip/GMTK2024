extends Node3D

var applicationReference = null

# Called when the node enters the scene tree for the first time.
func _ready():
    $CodeStationDisplay.hide()
    

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass

func _on_stage_area_body_entered(body):
    
    if body.is_in_group("player"):
        $CodeStationDisplay.show();
        


func _on_stage_area_body_exited(_body):
    pass
    #if body.is_in_group("player"):
        #if applicationReference == null:
            #$CodeStationDisplay.hide()
        
        
