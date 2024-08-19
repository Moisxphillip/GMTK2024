extends Area2D

const SPEED = Vector2(200.0, 200.0)
var direction = Vector2(0, 0)

func _ready():
	var x_direction = randf_range(0, 1)
	var y_direction = randf_range(-1, 1)
	direction = Vector2(x_direction, y_direction)
	return

func _process(delta):
	# Update position
	set_position(get_position() + direction * SPEED * delta)
	return

# Check if the area was clicked
func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int):
	if event.is_action_pressed("Click"):
		die()
	return

func die():
	queue_free()
	return
