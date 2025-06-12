extends PanelContainer

@export var play_move: Player_Character
var is_open: bool = false

@onready var item_label: Label = $MarginContainer/GridContainer/items/item_label
@onready var item_label2: Label = $MarginContainer/GridContainer/items2/item_label
@onready var item_label3: Label = $MarginContainer/GridContainer/items3/item_label
@onready var item_label4: Label = $MarginContainer/GridContainer/items4/item_label
@onready var item_label5: Label = $MarginContainer/GridContainer/items5/item_label
@onready var item_label6: Label = $MarginContainer/GridContainer/items6/item_label



func _ready() -> void:
	close()
	InventoryManager.inventory_changed.connect(on_inventory_changed)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("open_inventory"):
		if is_open:
			close()
		else:
			open()


func open():
	self.visible = true
	is_open = true

func close():
	self.visible = false
	is_open = false


func on_inventory_changed() -> void:
	var inventory: Dictionary = InventoryManager.inventory
	
	if inventory.has("log"):
		item_label.text = str(inventory["log"])
	
	if inventory.has("egg"):
		item_label3.text = str(inventory["egg"])
	
	if inventory.has("milk"):
		item_label4.text = str(inventory["milk"])
	
	if inventory.has("stone"):
		item_label2.text = str(inventory["stone"])
	
	if inventory.has("tomato"):
		item_label6.text = str(inventory["tomato"])
	
	if inventory.has("corn"):
		item_label5.text = str(inventory["corn"])
	
	#if inventory.has("seed"):
		#item_label.text = str(inventory["seed"])
