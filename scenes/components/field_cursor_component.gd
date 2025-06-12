class_name FieldCursorComponent
extends Node
#can be used on other projects as a component to overlay different terrains


@export var grass_tile_layer: TileMapLayer
@export var tilled_ground_tile_layer: TileMapLayer
@export var terrain_set: int = 0
@export var terrain: int = 3

@onready var player_character: Player_Character = get_tree().get_first_node_in_group("player_character")


var mouse_position: Vector2
#vector2 is a floating-point vector. It stores float values (x, y)
var cell_position: Vector2i
#vector2i is similar to vector2 only it stores int instead of float values for (x, y)
var cell_source_id: int
var local_cell_position: Vector2
var distance: float






func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("remove_dirt") or left_trigger_cross_controller():
		if ToolManager.selected_tool == DataTypes.tool_set.TillGround:
			get_cell_under_mouse()
			remove_tilled_soil_cell()
	elif event.is_action_pressed("interact"):
		if ToolManager.selected_tool == DataTypes.tool_set.TillGround:
			get_cell_under_mouse()
			add_tilled_soil_cell()


func get_cell_under_mouse() -> void:
	mouse_position = grass_tile_layer.get_local_mouse_position()
	#finds the mouse position on the tile layer set under grass_tile_layer
	cell_position = grass_tile_layer.local_to_map(mouse_position)
	#converts the pixel-based position of mouse_position to an integer cell coordinate
	cell_source_id = grass_tile_layer.get_cell_source_id(cell_position)
	#used to identify the source id of the specific cell in cell_position
	#it will return 1 if its a valid tile and will return a -1 if there is no tile or an invalid tile
	local_cell_position = grass_tile_layer.map_to_local(cell_position)
	#converts the cell_position to a local position in pixels.
	#useful for placing something exactly on a tile or highlighting the tie
	distance = player_character.global_position.distance_to(local_cell_position)
	#calculates the distance in pixels between the player and the tile's local position
	
	
	#print("mouse_position: ", mouse_position, "cell_pos: ", cell_postition, "cell_source: ", cell_source_id)
	#print("distance: ", distance)
	

func add_tilled_soil_cell() -> void:
	if distance < 20.0 && cell_source_id != -1:
		tilled_ground_tile_layer.set_cells_terrain_connect([cell_position], terrain_set, terrain, true)

func remove_tilled_soil_cell() -> void:
	if distance < 20.0:
		tilled_ground_tile_layer.set_cells_terrain_connect([cell_position], 0, -1, true)


func left_trigger_cross_controller() -> bool:
	var l2_hold = Input.is_action_pressed("l2")
	var cross_pressed = Input.is_action_just_pressed("x")
	return l2_hold and cross_pressed
