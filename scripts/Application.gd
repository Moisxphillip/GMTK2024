extends Node3D

enum PLACED { PLAYER, BUG, CODE, DEPLOY, SECURITY, TEST, OPERATE, PLAN}

var placed = PLACED.PLAN
var application_index = -1
var application_name = ""
var application_description = ""

#progress related to how much value can be generated
var code_progress = 0
var code_size = 100

# average value generation for this application
var avg_code_value:float = 0
@export var code_value_variance_percentage: float = 0
@export var rate_increase_code_value: float = 0.05

# the less code quality the greater the possibility to generate bugs or security failures
var avg_code_quality_percentage: float = 0
@export var rate_increase_quality_percentage: float = 0.05
@export var rate_decrease_quality_percentage: float = 0.01

# average cpu comsuption
var avg_cpu_comsuption: float = 0
@export var cpu_consuption_variance_percentage: float = 0.2

# average memory comsuption
var avg_memory_comsuption: float = 0
@export var memory_comsuption_variance_percentage: float = 0.2
    
func _ready():
    hide()
    
#increase code value
func increaseCodeValue():
    if code_progress <= code_size:
        avg_code_value += avg_code_value*rate_increase_code_value
        avg_code_quality_percentage -= rate_decrease_quality_percentage
        avg_code_quality_percentage = clamp(avg_code_quality_percentage,0,100)
        code_progress+=1
    
#generate value
func increaseCodeQuality():
    avg_code_quality_percentage += rate_increase_quality_percentage
    avg_code_quality_percentage = clamp(avg_code_quality_percentage,0,100)

func generateValueFromCode():
    var variance = code_value_variance_percentage*avg_code_value
    return randi_range (avg_code_value - variance, avg_code_value+variance)

func generateCPUComsuption():
    var variance = cpu_consuption_variance_percentage*avg_cpu_comsuption
    var res = randf_range (avg_cpu_comsuption - variance, avg_cpu_comsuption+variance)
    return res
    
func generateMemoryComsuption():
    var variance = memory_comsuption_variance_percentage*avg_memory_comsuption
    return randf_range (avg_memory_comsuption - variance, avg_memory_comsuption+variance)
    
func load_application(application):
    application_name = application["name"]
    application_description = application["description"]
    avg_cpu_comsuption = application["average_cpu"]
    avg_memory_comsuption = application["average_mem"]
    avg_code_value = application["code_value"]
    avg_code_quality_percentage = application["code_quality"]
    code_progress = application["code_progress"]
    code_size = application["code_size"]

