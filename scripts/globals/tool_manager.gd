extends Node

var selected_tool: DataTypes.tool_set = DataTypes.tool_set.None

signal tool_selected(tool: DataTypes.tool_set)


func select_tool(tool: DataTypes.tool_set) -> void:
	tool_selected.emit(tool)
	selected_tool = tool
