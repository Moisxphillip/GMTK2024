extends Node3D

var CPU_capacity:float = 200
var mem_capacity:float = 100
var total_CPU_usage:float = 0
var total_mem_usage: float = 0

var elapsed_time = 0

var requisitions_array = [
	{
		"cpu_usage": 10,
		"mem_usage": 10,
		"expires": 10
	},
]



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta
	
	var new_array = []
	
	for i in range(requisitions_array.size()-1, -1, -1):
		var req = requisitions_array[i]
		if elapsed_time > req["expires"]:
			total_CPU_usage -= req["cpu_usage"]
			total_mem_usage -= req["cpu_usage"]
		else: 
			new_array.append(req)
	requisitions_array = new_array
	
func add_req(cpu_usage:float, mem_usage:float, ttl:float):
	var req = {
		"cpu_usage": cpu_usage,
		"mem_usage": mem_usage,
		"expires": elapsed_time+ttl
	}
	total_CPU_usage += cpu_usage
	total_mem_usage += mem_usage
	Money.add_money(1)
	print(Money.current_amount_of_money)
	requisitions_array.append(req)
	
	
