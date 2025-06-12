class_name MagneticComponent
extends Area2D

@export var attraction_area_name: String
@export var grav_speed: float = 200.0

@onready var pull_source: CharacterBody2D = get_tree().current_scene.find_child("Player_Character", true, false)


var item_attraction: Vector2
#var local_position = to_local(global_position)
var targets: Array[Node2D] = []
#list of nodes inside the area
var direction = (item_attraction - global_position).normalized()

#velocity += direction * grav_speed * delta

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("apply_magnetic_pull"):
		#item_attraction = global_position - Player_Character.global_position
		#gravity_point_unit_distance
		targets.append(body)
		


func _on_body_exited(body: Node2D) -> void:
	targets.erase(body)
	

func _physics_process(delta: float) -> void:
	if !pull_source:
		return
		
	
