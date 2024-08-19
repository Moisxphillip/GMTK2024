extends "res://scripts/bug_base.gd"

# Check if the area was clicked
func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int):
	if event.is_action_pressed("Click"):
		die()
	return

func die():
	queue_free()
	SignalBus.on_kill.emit() # Tell the game this bug died
	return
