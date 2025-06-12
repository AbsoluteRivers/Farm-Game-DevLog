class_name CropsCursorComponent
extends Node

@export var tilled_soil_tile_layer: TileMapLayer

@onready var player_character: Player_Character = get_tree().get_first_node_in_group("player_character")

var corn_planting = preload("res://scenes/objects/plants/corn.tscn")
var tomato_planting = preload("res://scenes/objects/plants/tomato.tscn")

var mouse_position: Vector2
var cell_position: Vector2i
var cell_source_id: int
var local_cell_position: Vector2
var distance: float

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("remove_dirt") or left_trigger_cross_controller():
		if ToolManager.selected_tool == DataTypes.tool_set.TillGround:
			get_cell_under_mouse()
			remove_crop()
	elif event.is_action_pressed("interact"):
		if ToolManager.selected_tool == DataTypes.tool_set.PlantCorn or DataTypes.tool_set.PlantTomato:
			get_cell_under_mouse()
			add_crop()


func get_cell_under_mouse() -> void:
	mouse_position = tilled_soil_tile_layer.get_local_mouse_position()
	cell_position = tilled_soil_tile_layer.local_to_map(mouse_position)
	cell_source_id = tilled_soil_tile_layer.get_cell_source_id(cell_position)
	local_cell_position = tilled_soil_tile_layer.map_to_local(cell_position)
	distance = player_character.global_position.distance_to(local_cell_position)
	

func add_crop() -> void:
	if distance < 20.0:
		if ToolManager.selected_tool == DataTypes.tool_set.PlantCorn:
			var corn_instance = corn_planting.instantiate() as Node2D
			corn_instance.global_position = local_cell_position
			get_parent().find_child("crop_fields").add_child(corn_instance)
		
		if ToolManager.selected_tool == DataTypes.tool_set.PlantTomato:
			var tomato_instance = tomato_planting.instantiate() as Node2D
			tomato_instance.global_position = local_cell_position
			get_parent().find_child("crop_fields").add_child(tomato_instance)


func remove_crop() -> void:
	if distance < 20.0:
		var crop_nodes = get_parent().find_child("crop_fields").get_children()
		
		for node: Node2D in crop_nodes:
			if node.global_position == local_cell_position:
				node.queue_free()


func left_trigger_cross_controller() -> bool:
	var l2_hold = Input.is_action_pressed("l2")
	var cross_pressed = Input.is_action_just_pressed("x")
	return l2_hold and cross_pressed
