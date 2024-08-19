extends Area2D

const SPEED = Vector2(200.0, 200.0)

func _process(delta):
	var x_direction = randf_range(0, 1)
	var y_direction = randf_range(0, 1)
	var direction = Vector2(x_direction, y_direction)

	set_position(get_position() + direction * SPEED * delta)
	return

# Check if the area was clicked
func _input_event(viewport: Viewport, input_event: InputEvent, shape_idx: int):
	if input_event.is_action_pressed("Click"):
		die()
	return

func die():
	queue_free()
	return
