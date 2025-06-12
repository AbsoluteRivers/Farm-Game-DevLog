extends Sprite2D


@export var grav_speed: float = 200.0

@onready var pull_source: CharacterBody2D = get_tree().current_scene.find_child("Player_Character", true, false)


func _physics_process(delta: float) -> void:
	if !pull_source:
		return
	
	var direction = (pull_source.global_position - global_position).normalized()
	global_position += direction * grav_speed * delta
