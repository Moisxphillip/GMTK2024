extends CanvasLayer

@onready var Application = $"../Application"
@onready var applications = ApplicationStore.applications

func _ready():
	hide()
	for i in range(applications.size()):
		$Panel/Upgrades/GridContainer.get_child(i).fill(applications[i].name, applications[i].price, applications[i].description, button_text(i), i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Application.placed == Application.PLACED.PLAN:			
		for i in $Panel/Upgrades/GridContainer.get_child_count():
			$Panel/Upgrades/GridContainer.get_child(i).fill_button(button_text(i))
	
	
func button_text(idx):
	if ApplicationStore.active_appication_index == idx:
		return "ACTIVE"
	elif applications[idx]["paid"]:
		return "USE"
	else:
		return "BUY"
	

func _on_close_button_pressed():
	hide() 
	$"../Player".isLockedOnAction = false
	$"../Player".take_item()
	Application.placed =  Application.PLACED.PLAYER
