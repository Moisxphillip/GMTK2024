extends CanvasLayer

var active_appication_index = -1
var isInteracting = false
var hasStarted = false
@onready var Application = $"../Application"	
	
func save_application(app_index):
	applications[app_index]["code_value"] = Application.avg_code_value
	applications[app_index]["code_quality"] = Application.avg_code_quality_percentage
	applications[app_index]["code_progress"] = Application.code_progress
	
func buy(application_idx):
	if Application.application_index != active_appication_index and Application.application_index != -1:
		save_application(Application.application_index)
	
	if applications[application_idx]["paid"]:
		active_appication_index = application_idx
		Application.load_application(ApplicationStore.get_active_application())
		Application.placed = Application.PLACED.PLAYER
		return true
	elif Money.current_amount_of_money >= applications[application_idx]["price"]:
		Money.take_money(applications[application_idx]["price"])
		applications[application_idx]["paid"] = true
		active_appication_index = application_idx
		Application.load_application(ApplicationStore.get_active_application())
		Application.placed = Application.PLACED.PLAYER
		return true
	else:
		return false
	
func get_active_application():
	return applications[active_appication_index]
	
var applications = [
	{
		"code_value":10.0,
		"code_quality":0,
		"price":0,
		"paid":false,
		"name":"Landing Page",
		"description":"A simple landing page for a company.",
		"requires_cpu":100,
		"average_cpu":10,
		"requires_mem":100,
		"average_mem":10,
		"bug_probability":0.1,
		"bug_difficulty":1,
		"sec_probability":0.02,
		"sec_difficulty": 1,
		"peak_probability": 0.05,
		"code_size":100,
		"code_progress":0,
		"image":null,
	},
	{
		"price":20000,
		"paid":false,
		"name":"E-commerce",
		"description":"A platform for buying products of a medium business.",
		"requires_cpu":250,
		"average_cpu":25,
		"requires_mem":250,
		"average_mem":25,
		"bug_probability":0.2,
		"bug_difficulty":1,
		"sec_probability":0.1,
		"sec_difficulty": 2,
		"peak_probability": 0.15,
		"code_value":60,
		"code_quality":0,
		"code_size":200,
		"code_progress":0,
		"image":null,
	},
	{
		"price":50000,
		"paid":false,
		"name":"Online Game",
		"description":"An online game with a loyal base of players, but some eventual peaks..",
		"requires_cpu":300,
		"average_cpu":30,
		"requires_mem":300,
		"average_mem":30,
		"bug_probability":0.2,
		"bug_difficulty":2,
		"sec_probability":0.1,
		"sec_difficulty": 1,
		"peak_probability": 0.3,
		"code_value":100,
		"code_quality":0,
		"code_size":300,
		"code_progress":0,
		"image":null,
	},
	{
		"price":500000,
		"paid":false,
		"name":"Social Network",
		"description":"An application for social interacting that allow users to post content.",
		"requires_cpu":500,
		"average_cpu":50,
		"requires_mem":500,
		"average_mem":50,
		"bug_probability":0.5,
		"bug_difficulty":2,
		"sec_probability":0.4,
		"sec_difficulty": 3,
		"peak_probability": 0.5,
		"code_value":250,
		"code_quality":0,
		"code_size":400,
		"code_progress":0,
		"image":null,
	},
	{
		"price":2000000,
		"paid":false,
		"name":"Video Streaming Service",
		"description":"Streaming of movies and series to the whole world",
		"requires_cpu":1000,
		"average_cpu":100,
		"requires_mem":500,
		"average_mem":50,
		"bug_probability":0.7,
		"bug_difficulty":3,
		"sec_probability":0.5,
		"sec_difficulty": 3,
		"peak_probability": 0.6,
		"code_value":500,
		"code_quality":0,
		"code_size":500,
		"code_progress":0,
		"image":null,
	},
]
