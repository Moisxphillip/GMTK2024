extends Node3D
#Precisa ter os servers como child

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_children()
	pass

func distribute_requisition(cpu_usage:float, mem_usage:float, ttl:float):
	var number_of_servers = get_child_count()
	var total_free_cpu = 0
	var total_cpu = 0
	var total_free_mem = 0
	var total_mem = 0
	var free_cpu_per_server = []
	var free_mem_per_server = []
	for i in range(number_of_servers):
		free_cpu_per_server[i] = get_child(i).CPU_capacity - get_child(i).CPU_usage
		total_cpu += get_child(i).CPU_capacity
		total_free_cpu += free_cpu_per_server[i] 
		free_mem_per_server[i] = get_child(i).mem_capacity - get_child(i).mem_usage
		total_mem += get_child(i).mem_capacity
		total_free_mem += free_mem_per_server[i]
		
	var most_free_space = 0
	var most_free_space_idx = 0
	if total_free_cpu / total_cpu > total_free_mem / total_mem:
		for i in range(number_of_servers):
			var amount = free_cpu_per_server[i] / total_free_cpu 
			if amount > most_free_space:
				most_free_space = amount
				most_free_space_idx = i
	else:
		for i in range(number_of_servers):
			var amount = free_mem_per_server[i] / total_free_mem
			if amount > most_free_space:
				most_free_space = amount
				most_free_space_idx = i
				
	get_child(most_free_space_idx).add_req(cpu_usage, mem_usage, ttl)
		
		
