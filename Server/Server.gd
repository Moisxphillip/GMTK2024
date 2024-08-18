extends Node3D

var CPU_Capacity:float = 200
var mem_Capacity:float = 100
var CPU_used:float = 0
var mem_used: float = 0

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
	
	for i in range(requisitions_array.size()-1, -1 -1):
		var req = requisitions_array[i]
		if elapsed_time > req["expires"]:
			CPU_used -= req["cpu_usage"]
			mem_used -= req["cpu_usage"]
			requisitions_array.remove(i)
	
func add_req(cpu_usage:float, mem_usage:float, ttl:float):
	var req = {
		"cpu_usage": cpu_usage,
		"mem_usage": mem_usage,
		"expires": elapsed_time+ttl
	}
	CPU_used += cpu_usage
	mem_used += mem_usage
	requisitions_array.append(req)
	
	
