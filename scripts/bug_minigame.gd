extends Node2D

var BUG = preload("res://scenes/bug.tscn")

# @TODO: test timer
const TIMER_RESET_VALUE = 0.1
var timer = TIMER_RESET_VALUE

# @TODO: create more walk patterns
func spawn_bug():
	# Choose a random spawn point outside the window
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	var safe_spawn_radius = sqrt(width * width + height * height) / 1.5 # Always leave a little margin
	var camera_position = get_viewport().get_camera_2d().global_position
	var spawn_point = camera_position + Vector2(safe_spawn_radius, 0).rotated(randf_range(0, 2 * PI))
	var bug = BUG.instantiate()

	bug.global_position = spawn_point
	add_child(bug)
	return

func _process(delta):
	timer -= delta

	if timer <= 0:
		spawn_bug()
		timer = TIMER_RESET_VALUE
	return
