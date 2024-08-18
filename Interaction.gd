extends Area3D

@onready var animation = $Animation
# Called when the node enters the scene tree for the first time.
func _ready():
    animation.play("Off")
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func _on_body_entered(_body):
    animation.play("On")
    pass # Replace with function body.


func _on_body_exited(_body):
    animation.play("Off")
    pass # Replace with function body.
