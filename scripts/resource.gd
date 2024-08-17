extends Node

var starting_value: float = 0:
	set(new_value):
		starting_value = new_value
	get:
		return starting_value

var max_value: float = 0:
	set(new_value):
		max_value = new_value
	get:
		return max_value

var current_value: float = 0:
	get:
		return current_value

var value_generated_per_second: float = 0:
	set(new_value):
		value_generated_per_second = new_value
	get:
		return value_generated_per_second

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
