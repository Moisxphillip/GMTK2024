extends CanvasLayer

enum {LB, VS, SV, CC, QU, AT, SC}

@onready var upgrades = UpgradeStore.upgrades

# Called when the node enters the scene tree for the first time.
func _ready():
	var current_upgrades = UpgradeStore.get_shop_cards()
	
	for i in current_upgrades.size():
		var up = current_upgrades[i]
		$Panel/Upgrades/GridContainer.get_child(i).fill(up["category"], up["name"], up["description"], up["price"], i)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_upgrades = UpgradeStore.get_shop_cards()
	for i in $Panel/Upgrades/GridContainer.get_child_count():
		if i <= current_upgrades.size()-1:
			var up = current_upgrades[i]
			$Panel/Upgrades/GridContainer.get_child(i).fill(up["category"], up["name"], up["description"], up["price"], i)
		else:
			$Panel/Upgrades/GridContainer.get_child(i).hide()

func _on_button_pressed():
	hide() 
	$"../Player".isLockedOnAction = false
	$"../Player".take_item()
	Application.placed =  Application.PLACED.PLAYER
