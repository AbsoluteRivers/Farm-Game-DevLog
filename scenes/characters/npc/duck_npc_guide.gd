extends Node2D

var balloon_scene = preload("res://dialogue/game_dialogue_baloon.tscn")

@onready var interactable_component: interactable_component_door = $InteractableComponent
@onready var interactable_label_component: Control = $InteractableLabelComponent


func _ready() -> void:
	interactable_component.interactable_activated.connect(on_interactable_activated)
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	
	interactable_label_component.hide()


func on_interactable_activated() -> void:
	interactable_label_component.show()
	


func on_interactable_deactivated() -> void:
	interactable_label_component.hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("talk_access"):
		var balloon: BaseGameDialogueBaloon = balloon_scene.instantiate()
		get_tree().current_scene.add_child(balloon)
		#gets tree of current scene and adds a child node of the dialogue balloon
		balloon.start(load("res://dialogue/conversations/guide.dialogue"), "start")
		#first argument loads the scene, second argument is the "start" function of the dialogue script of the .dialogue
