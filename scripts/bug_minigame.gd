extends Node2D

# The bug minigame spawn random bugs that run across the screen. When killed they yield points.
# The bugs spawn when the timer runs outs and are killed when the user clicks on them or if they
# reach the end of a safe zone.

const BUG_ENEMY = preload("res://scenes/bug_enemy.tscn")
const BUG_FRIENDLY = preload("res://scenes/bug_friendly.tscn")

@export var min_enemy_bug_speed = Vector2(100, 100)
@export var max_enemy_bug_speed = Vector2(200, 200)
@export var min_friendly_bug_speed = Vector2(50, 50)
@export var max_friendly_bug_speed = Vector2(100, 100)
@export var friendly_bug_odds = 0.1
@export var number_of_bugs_killed_to_end_game = 4

var total_bugs_killed = 0

func _ready():
	SignalBus.on_kill.connect(on_bug_killed)
	return

func spawn_bug():
	# Choose a random spawn point outside the window
	var width = get_viewport().size.x
	var height = get_viewport().size.y
	var safe_spawn_radius = sqrt(width * width + height * height) / 2.0
	var camera_position = get_viewport().get_camera_2d().global_position
	var spawn_point = camera_position + Vector2(safe_spawn_radius, 0).rotated(randf_range(0, 2 * PI))

	# Choose between friendly and enemy bugs
	var bug = 0
	if randf_range(0, 1) <= friendly_bug_odds:
		bug = BUG_FRIENDLY.instantiate()
		bug.speed = Vector2(randf_range(min_friendly_bug_speed.x, max_friendly_bug_speed.x), 
							randf_range(min_friendly_bug_speed.y, max_friendly_bug_speed.y))
	else:
		bug = BUG_ENEMY.instantiate()
		bug.speed = Vector2(randf_range(min_enemy_bug_speed.x, max_enemy_bug_speed.x), 
							randf_range(min_enemy_bug_speed.y, max_enemy_bug_speed.y))

	bug.global_position = spawn_point
	add_child(bug)
	return

# Spawn new bugs
func _on_spawn_timer_timeout():
	spawn_bug()
	return

# Kill bugs that exit the killzone
func _on_safe_zone_area_exited(area):
	area.queue_free()
	return

# Keep track of bugs killed
func on_bug_killed():
	total_bugs_killed += 1
	if total_bugs_killed >= number_of_bugs_killed_to_end_game:
		queue_free()
	return
