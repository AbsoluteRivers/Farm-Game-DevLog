extends Control

@export var play_move: Player_Character
var is_open: bool = false


func _ready() -> void:
	close()
	

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
