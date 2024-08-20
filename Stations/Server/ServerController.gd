extends Node3D

@onready var requisition_generator = $RequisitionQueue/RequisitionGenerator
@onready var load_balancer = $LoadBalancer
@onready var first_server = $LoadBalancer/Server2
var application = null
	
func deploy_application():
	var req = ApplicationStore.get_active_application()
	
	if first_server.CPU_capacity >= req["requires_cpu"] and first_server.mem_capacity >= req["requires_mem"]:
		application = Application.duplicate()
		requisition_generator.application = application
		load_balancer.application = application
	else:
		pass
		#this serve cannot run this application
