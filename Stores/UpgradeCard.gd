class_name UpgradeCard
extends Panel

var card_category = null

var cname = ""
var description = ""
var price = ""
var index = -1

func fill(category, caname, description, price, idx):
	card_category = category
	$Name.text  = caname
	$Description.text= description
	$Price.text = str(price)
	index = idx


func _on_button_pressed():
	UpgradeStore.buy_card(card_category)
