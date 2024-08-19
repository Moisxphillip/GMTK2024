class_name Store
extends CanvasLayer

enum {LB, VS, SV, CC, QU, AT, SC}

var shop_cards = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shop_cards = []
	
	for category in upgrades:
		for card in category["cards"]:
			if not card["active"]:
				shop_cards.append(card)
				break
				
func get_current_level_by_category(category):
	for cat in upgrades:
		if cat["category"] == category:
			var current_level = 0
			for i in range(cat["cards"].size()):
				if cat["cards"][i]["active"]:
					current_level = i+1
			return current_level
			
#TODO lógica pra ativar os cards pela interface
				
			
			


var upgrades = [
	{
		"category": LB,
		"cards": [
			{
				"name":"Load Balancer 1",
				"description":"Distributes requisitions dynamically. \n Increases the number of servers to 2. \n\n ",
				"level": 1,
				"image":null,
				"active": false
			},
			{
				"name":"Load Balancer 2",
				"description":"Distributes requisitions dynamically. \n AIncreases the number of servers to 3. \n\n ",
				"level": 2,
				"image":null,
				"active": false
			},
			{
				"name":"Load Balancer 3",
				"description":"Distributes requisitions dynamically. \n Increases the number of servers to 5. \n\n ",
				"level": 3,
				"image":null,
				"active": false
			},	
		]
	},
	{
		"category": VS,
		"cards": [
			{
				"name":"Vertical Scalling 1",
				"description":"Adds additional memory and cpu to all servers, increasing it's capacity by 50%. \n\n ",
				"level": 1,
				"image":null,
				"active": false
			},
			{
				"name":"Vertical Scalling 2",
				"description":"Adds additional memory and cpu to all servers. \n increasing it's capacity by 100%. \n\n ",
				"level": 2,
				"image":null,
				"active": false
			},
			{
				"name":"Vertical Scalling 3",
				"description":"Adds additional memory and cpu to all servers. \n increasing it's capacity by 200%. \n\n ",
				"level": 3,
				"image":null,
				"active": false
			},
		]
	},
	{
		"category": SV,
		"cards": [
			{
				"name":"Server lvl 1",
				"description":"Increases the base capacity of all servers.",
				"level": 1,
				"image":null,
				"active": false
			},
			{
				"name":"Server lvl 2",
				"description":"Increases the base capacity of all servers to a medium level.",
				"level": 2,
				"image":null,
				"active": false
			},
			{
				"name":"Server lvl 3",
				"description":"Increases the base capacity of all servers to the max level",
				"level": 3,
				"image":null,
				"active": false
			},
		]
	},
	{
		"category": CC,
		"cards": [
			{
				"name":"Cache lvl 1",
				"description":"Reduces the amount of requests to the server by 10%",
				"level": 1,
				"image":null,
				"active": false
			},
			{
				"name":"Cache lvl 2",
				"description":"Reduces the amount of requests to the server by 30%",
				"level": 2,
				"image":null,
				"active": false
			},
			{
				"name":"Cache lvl 3",
				"description":"Reduces the amount of requests to the server by 50%",
				"level": 3,
				"image":null,
				"active": false
			},
		]
	},
	{
		"category": QU,
		"cards": [
			{
				"name":"Queue lvl 1",
				"description":"Stores a small part of the requisitions, reducing money losses over indisponibility by 25%",
				"level": 3,
				"image":null,
				"active": false
			},
			{
				"name":"Queue lvl 2",
				"description":"Stores a good amount of the requisitions, reducing money losses over indisponibility by 50%",
				"level": 2,
				"image":null,
				"active": false
			},
			{
				"name":"Queue lvl 3",
				"description":"Stores all requisitions, no money will be lost over indisponibility",
				"level": 3,
				"image":null,
				"active": false
			},
		]
	},
	{
		"category": AT,
		"cards": [
			{
				"name":"Automated Testing lvl 1",
				"description":"All code starts with 15% quality",
				"level": 3,
				"image":null,
				"active": false
			},
			{
				"name":"Automated Testing lvl 2",
				"description":"All code starts with 30% quality",
				"level": 2,
				"image":null,
				"active": false
			},
			{
				"name":"Automated Testing lvl 3",
				"description":"All code starts with 50% quality",
				"level": 3,
				"image":null,
				"active": false
			},
		]
	},
	{
		"category": AT,
		"cards": [
			{
				"name":"Automated Testing lvl 1",
				"description":"All code starts with 15% quality",
				"level": 3,
				"image":null,
				"active": false
			},
			{
				"name":"Automated Testing lvl 2",
				"description":"All code starts with 30% quality",
				"level": 2,
				"image":null,
				"active": false
			},
			{
				"name":"Automated Testing lvl 3",
				"description":"All code starts with 50% quality",
				"level": 3,
				"image":null,
				"active": false
			},
		]
	},
	{
		"category": SC,
		"cards": [
			{
				"name":"Security Checker lvl 1",
				"description":"Reduces the chance of Security Incidents by 15%",
				"level": 3,
				"image":null,
				"active": false
			},
			{
				"name":"Security Checker lvl 2",
				"description":"Reduces the chance of Security Incidents by 30%",
				"level": 2,
				"image":null,
				"active": false
			},
			{
				"name":"Security Checker lvl 3",
				"description":"Reduces the chance of Security Incidents by 50%",
				"level": 3,
				"image":null,
				"active": false
			},
		]
	},
	
	
	
]
