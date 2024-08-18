class_name Requisition
extends PathFollow3D

var cpu_usage: float
var mem_usage: float
var time_to_leave: float


var pathFollow = null
var elapsed_time: float = 0



# Called when the node enters the scene tree for the first time.
func _ready():

	var label = Label3D.new()
	var chars = "abcdefghijklmnopqrstuvwxyz0123456789"
	label.text = chars[randi()%chars.length()]
	label.font_size = 12
	label.outline_size = 0
	label.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC
	
	pathFollow = PathFollow3D.new()
	
	self.add_child(label)
	
func _process(delta):
	elapsed_time += delta
	progress_ratio =  clamp(elapsed_time/2,0, 1)
	rotation_mode = PathFollow3D.ROTATION_NONE
	
	if progress_ratio >= 1:
		queue_free()
	
	
	


