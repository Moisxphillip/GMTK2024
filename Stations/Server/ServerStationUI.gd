extends Control

@onready var server = $"../../LoadBalancer/Server2"
func _ready():
	pass
	
	
func _process(_delta):
	$ServerStationUI/CPUBar.value = server.total_CPU_usage / server.CPU_capacity * 100
	$ServerStationUI/MemBar.value = server.total_mem_usage / server.mem_capacity * 100
	

		
