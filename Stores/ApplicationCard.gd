class_name ApplicationCard
extends Panel

var pressed = false
var index = 0

func fill(name, price, description, button, idx):
	$Name.text = name
	$Price.text = str(price)
	$Description.text = description
	$Button.text = button
	index = idx

func fill_button(text):
	$Button.text = text

func _on_button_pressed():
	ApplicationStore.buy(index)
		
