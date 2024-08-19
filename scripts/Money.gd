extends Node

@export var current_amount_of_money: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_money(amount:int):
	current_amount_of_money += amount
	
func take_money(amount:int):
	current_amount_of_money -= amount
