extends Node3D

#tempo entre geração de requisições
@export var avg_time_between_reqs_seconds:float = 1.0
@export var avg_var_time_btw_req_percentage:float =  0.2
var last_generated_time = 0;
var elapsed_time = 0;

@export var avg_time_to_leave = 1
@export var time_to_leave_variance= 0.2
var application = null


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
	if application != null:
		var requisition = Requisition.new()
		requisition.cpu_usage = application.generateCPUComsuption()
		requisition.mem_usage = application.generateMemoryComsuption()
		requisition.time_to_leave = generate_ttl()
		
		requisition.load_balancer = get_parent().LoadBalancer
		requisition.position.x = randf_range(-2.2,2.2)
		get_parent().pathToFollow.add_child(requisition)

func generate_ttl():
	var variance = time_to_leave_variance*avg_time_to_leave
	return randi_range(avg_time_to_leave - variance, avg_time_to_leave+variance)
	
