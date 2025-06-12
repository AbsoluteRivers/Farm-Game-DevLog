class_name Player_Character
extends CharacterBody2D
#class inheritance

@export var current_tool: DataTypes.tool_set = DataTypes.tool_set.None




var player_direction: Vector2


func _ready() -> void:
	ToolManager.tool_selected.connect(on_tool_selected)
	

#func _process(delta: float) -> void:
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#if get_viewport().gui_get_hovered_control() != null:
			#return
		

	


func on_tool_selected(tool: DataTypes.tool_set) -> void:
	current_tool = tool
	#hit_component.current_tool = tool

#providing a class name will extend CharacterBody2d functions and any other variables and functons written in the script
#call the class name to the appropriate export var
