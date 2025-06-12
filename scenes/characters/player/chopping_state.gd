extends NodeState

@export var player_character: Player_Character
@export var animated_sprite_2d: AnimatedSprite2D
@export var hit_component_collision_shape: CollisionShape2D
@export var hit_comp: HitComponent

#var state_machine: NodeStateMachine

func _ready() -> void:
	
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0, 0)

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	#if state_machine.is_ui_active:
		#return
	if !animated_sprite_2d.is_playing():
		transition.emit("idle")


func _on_enter() -> void:
	hit_comp.current_tool = DataTypes.tool_set.AxeWood
	
	
	if player_character.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("chopping_front")
		hit_component_collision_shape.position = Vector2(-3, 2)
	elif player_character.player_direction == Vector2.UP:
		animated_sprite_2d.play("chopping_back")
		hit_component_collision_shape.position = Vector2(3, -20)
	elif player_character.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("chopping_right")
		hit_component_collision_shape.position = Vector2(9, -1)
	elif player_character.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("chopping_left")
		hit_component_collision_shape.position = Vector2(-9, 1)
	else:
		animated_sprite_2d.play("chopping_front")
	
	
	hit_component_collision_shape.disabled = false
	




func _on_exit() -> void:
	hit_comp.current_tool = DataTypes.tool_set.None
	animated_sprite_2d.stop()
	hit_component_collision_shape.disabled = true
