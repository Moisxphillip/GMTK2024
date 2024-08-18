extends Node3D

#tempo entre geração de requisições
@export var avg_time_between_reqs_seconds:float = 1.0
@export var avg_var_time_btw_req_percentage:float =  0.2
var last_generated_time = 0;
var elapsed_time = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta;
	
	var time_var = avg_time_between_reqs_seconds * avg_var_time_btw_req_percentage;
	var rand_interval =  randi_range(avg_time_between_reqs_seconds - time_var, avg_time_between_reqs_seconds + time_var)
	
	if elapsed_time >= last_generated_time + rand_interval:
		last_generated_time = elapsed_time
		generate_requisition()
		
func generate_requisition():
	var requisition = Requisition.new()
	requisition.position.x = randf_range(-0.2,0.2)
	get_parent().pathToFollow.add_child(requisition)
	
