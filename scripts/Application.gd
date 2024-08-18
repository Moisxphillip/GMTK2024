extends Node3D

@export var application_name: String

# average value generation for this application
@export var avg_code_value:float = 0
@export var code_value_variance_percentage: float = 0
@export var rate_increase_code_value: float = 0

# the less code quality the greater the possibility to generate bugs or security failures
@export var avg_code_quality_percentage: float = 0
@export var rate_increase_quality_percentage: float = 0
@export var rate_decrease_quality_percentage: float = 0

# average cpu comsuption
@export var avg_cpu_comsuption: float = 0
@export var cpu_consuption_variance_percentage: float = 0

# average memory comsuption
@export var avg_memory_comsuption: float = 0
@export var memory_comsuption_variance_percentage: float = 0

    
#increase code value
#TODO code value incremente can depend 
func increaseCodeValue():
    avg_code_value += rate_increase_code_value
    avg_code_quality_percentage -= rate_decrease_quality_percentage
    
#generate value
func increaseCodeQuality():
    avg_code_quality_percentage += rate_increase_quality_percentage


func generateValueFromCode():
    var variance = code_value_variance_percentage*avg_code_value
    return randi_range (avg_code_value - variance, avg_code_value+variance)

func generateCPUConsuption():
    var variance = cpu_consuption_variance_percentage*avg_cpu_comsuption
    return randi_range (avg_cpu_comsuption - variance, avg_cpu_comsuption+variance)
    
func generateMemoryComsuption():
    var variance = memory_comsuption_variance_percentage*avg_memory_comsuption
    return randi_range (avg_memory_comsuption - variance, avg_memory_comsuption+variance)

