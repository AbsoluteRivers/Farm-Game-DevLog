class_name SaveLevelDataComponent

extends Node

var level_scene_name: String
var save_game_data_path: String = "user://game_data/"
#check on file paths where the user:// path will be. In the godot site "cheat sheet"
#creates a game data folder
var save_file_name: String = "save_%s_game_data.tres"
#the file name consist of a format operator %s
#format operator will be named the level_scene_name when saved
var game_data_resource: SavedGameDataResource


func _ready() -> void:
	add_to_group("save_level_data_component")
	level_scene_name = get_parent().name
	#gets the name of the parent node, in this case TestSceneCropField
	#this will use the parent node name as part of the save data file name

func save_node_data() -> void:
	var nodes = get_tree().get_nodes_in_group("save_data_component")
	
	game_data_resource = SavedGameDataResource.new()
	
	if nodes != null:
		for node: SaveDataComponent in nodes:
			if node is SaveDataComponent:
				var save_data_resource: NodeDataResource = node._save_data()
				var save_final_resource = save_data_resource.duplicate()
				game_data_resource.save_data_nodes.append(save_final_resource)
				#adds the theplicate of save_data_resource stored in save_final_resource on save_data_nodes of the SavedGameDataResource component
				


func save_game() -> void:
	if !DirAccess.dir_exists_absolute(save_game_data_path):
		DirAccess.make_dir_absolute(save_game_data_path)
		#checks if the directory exists
		#if the directory does not exists, it will pass a script to make a directory
	
	var level_save_file_name: String = save_file_name % level_scene_name
	#creates the correct file name using the level_scene name unto the save_file name
	
	save_node_data()
	
	var result: int = ResourceSaver.save(game_data_resource, save_game_data_path + level_save_file_name)
	#save passes an argument 1 for the resource, argument 2 for the path, and argument 3 to check for flags
	print("Save result: ", result)
	

func load_game() -> void:
	var level_save_file_name: String = save_file_name % level_scene_name
	var save_game_path: String = save_game_data_path + level_save_file_name
	
	if !FileAccess.file_exists(save_game_path):
		return
	
	game_data_resource = ResourceLoader.load(save_game_path)
	
	if game_data_resource == null:
		return
	
	var root_node: Window = get_tree().root
	
	for resource in game_data_resource.save_data_nodes:
		if resource is Resource:
			if resource is NodeDataResource:
				resource._load_data(root_node)
	
