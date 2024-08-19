extends Area2D

var speed = Vector2(200.0, 200.0)
var direction = Vector2(0, 0)

func _ready():
	var x_direction = randf_range(0, 1)
	var y_direction = randf_range(-1, 1)
	direction = Vector2(x_direction, y_direction)
	return

func _process(delta):
	# Update position
	set_position(get_position() + direction * speed * delta)
	return
