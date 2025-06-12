extends NodeState

#@export var player_character: CharacterBody2d
@export var player_character: Player_Character
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 125


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvent.movement_input()
	
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up","move_down")
	direction = direction.normalized()
	
	if direction == Vector2.UP:
		animated_sprite_2d.play("walk_back")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	
	if direction != Vector2.ZERO:
		player_character.player_direction = direction
		#player_direction won't appear in the intellisense since we use Dynamic types
		#need to provide a class name to the script where the type/variable is located to be able to call
	
	player_character.velocity = direction * speed
	player_character.move_and_slide()


func _on_next_transitions() -> void:
	if !GameInputEvent.is_movement_input():
		transition.emit("idle")
	elif Input.is_action_just_released("sprint"):
		transition.emit("walk")
	


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
	
