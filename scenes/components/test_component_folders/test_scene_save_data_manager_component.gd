class_name TestSceneSaveDataManagerComponent

extends Node


func _ready() -> void:
	call_deferred("load_test_scene")
	#call_deferred makes sure that the save_data_component and the save_level_data_component have been loaded in the scene tree first
	#will call the argument load_test_scene in the next frame

func load_test_scene():
	SaveGameManager.load_game()
