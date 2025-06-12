class_name ToolBox

extends PanelContainer


@onready var unarmed_tool: Button = $MarginContainer/HBoxContainer/unarmed_tool
@onready var water_can_tool: Button = $MarginContainer/HBoxContainer/water_can_tool
@onready var hoe_tool: Button = $MarginContainer/HBoxContainer/hoe_tool
@onready var axe_tool: Button = $MarginContainer/HBoxContainer/axe_tool
@onready var seed_tool: Button = $MarginContainer/HBoxContainer/seed_tool
@onready var tomato_seed_tool: Button = $MarginContainer/HBoxContainer/tomato_seed_tool




@onready var l_button: Button = $MarginContainer/HBoxContainer/seed_tool/l_button
@onready var r_button: Button = $MarginContainer/HBoxContainer/seed_tool/r_button
@onready var tomato_l_button: Button = $MarginContainer/HBoxContainer/tomato_seed_tool/tomato_l_button
@onready var tomato_r_button: Button = $MarginContainer/HBoxContainer/tomato_seed_tool/tomato_r_button



#var corn_seed = preload("res://scenes/own_tests/UI/buttons/corn_seed.tscn")
#var tomato_seed = preload("res://scenes/own_tests/UI/buttons/tomato_seed.tscn")
#var corn_seed_instance = corn_seed.instantiate() as Button
#var tomato_seed_instance = tomato_seed.instantiate() as Button

signal is_mouse_over_ui(active: bool)
#var is_mouse_over_ui: bool = false

func _ready() -> void:
	#unarmed_tool.grab_focus()
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	tomato_seed_tool.visible = false
	
	l_button.visible = false
	#l_button.set_process_input(false)
	r_button.visible = false
	tomato_l_button.visible = false
	tomato_r_button.visible = false
	
	
	#is_mouse_over_ui.connect(_on_is_mouse_over_ui)
	#used to check if mouse hovers tool panel


	#if mouse_entered:
		#is_mouse_over_ui = true
	#else:
		#is_mouse_over_ui = false

func _on_mouse_entered():
	emit_signal("is_mouse_over_ui", true)
	
	#is_mouse_over_ui = true

func _on_mouse_exited():
	emit_signal("is_mouse_over_ui", false)
	
	#is_mouse_over_ui = false




func _on_unarmed_tool_pressed() -> void:
	l_button.visible = false
	r_button.visible = false
	tomato_l_button.visible = false
	tomato_r_button.visible = false
	ToolManager.select_tool(DataTypes.tool_set.None)



func _on_axe_tool_pressed() -> void:
	l_button.visible = false
	r_button.visible = false
	tomato_l_button.visible = false
	tomato_r_button.visible = false
	ToolManager.select_tool(DataTypes.tool_set.AxeWood)



func _on_hoe_tool_pressed() -> void:
	l_button.visible = false
	r_button.visible = false
	tomato_l_button.visible = false
	tomato_r_button.visible = false
	ToolManager.select_tool(DataTypes.tool_set.TillGround)
	


func _on_water_can_tool_pressed() -> void:
	l_button.visible = false
	r_button.visible = false
	tomato_l_button.visible = false
	tomato_r_button.visible = false
	ToolManager.select_tool(DataTypes.tool_set.WaterCrops)
	


func _on_seed_tool_pressed() -> void:
	l_button.visible = true
	r_button.visible = true
	tomato_l_button.visible = true
	tomato_r_button.visible = true
	ToolManager.select_tool(DataTypes.tool_set.PlantCorn)


func _on_tomato_seed_tool_pressed() -> void:
	tomato_l_button.visible = true
	tomato_r_button.visible = true
	l_button.visible = true
	r_button.visible = true
	ToolManager.select_tool(DataTypes.tool_set.PlantTomato)



func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			ToolManager.select_tool(DataTypes.tool_set.None)
			
			axe_tool.release_focus()
			hoe_tool.release_focus()
			water_can_tool.release_focus()
			seed_tool.release_focus()





func _on_unarmed_tool_mouse_entered() -> void:
	emit_signal("is_mouse_over_ui", true)


func _on_water_can_tool_mouse_entered() -> void:
	emit_signal("is_mouse_over_ui", true)


func _on_hoe_tool_mouse_entered() -> void:
	emit_signal("is_mouse_over_ui", true)


func _on_axe_tool_mouse_entered() -> void:
	emit_signal("is_mouse_over_ui", true)


func _on_seed_tool_mouse_entered() -> void:
	emit_signal("is_mouse_over_ui", true)






func _on_is_mouse_over_ui(active: bool) -> void:
	if active:
		print("mouse if over ui")
	else:
		print("mouse is NOT over ui")



func _on_l_button_pressed() -> void:
	seed_tool.visible = false
	tomato_seed_tool.visible = true
	ToolManager.select_tool(DataTypes.tool_set.PlantTomato)
	#if ToolManager.selected_tool == DataTypes.tool_set.PlantCorn:
		#add_child(tomato_seed_instance)
		#get_parent().queue_free()
		#return
	
	#if ToolManager.selected_tool == DataTypes.tool_set.PlantTomato:
		#add_child(corn_seed_instance)
		#get_parent().queue_free()
		#return
	


func _on_r_button_pressed() -> void:
	seed_tool.visible = false
	tomato_seed_tool.visible = true
	ToolManager.select_tool(DataTypes.tool_set.PlantTomato)
	#if ToolManager.selected_tool == DataTypes.tool_set.PlantCorn:
		
		#remove_child(seed_tool)
		#get_parent().queue_free()
		#add_child(tomato_seed_instance)
		#move_child(tomato_seed_instance, 2)
		#return
	
	#if ToolManager.selected_tool == DataTypes.tool_set.PlantTomato:
		#remove_child(seed_tool)
		#get_parent().queue_free()
		#add_child(corn_seed_instance)
		#move_child(corn_seed_instance, 2)
		#return


func _on_tomato_l_button_pressed() -> void:
	tomato_seed_tool.visible = false
	seed_tool.visible = true
	ToolManager.select_tool(DataTypes.tool_set.PlantCorn)


func _on_tomato_r_button_pressed() -> void:
	tomato_seed_tool.visible = false
	seed_tool.visible = true
	ToolManager.select_tool(DataTypes.tool_set.PlantCorn)
	
