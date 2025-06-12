extends NodeState

@export var player_character: Player_Character
@export var animated_sprite_2d: AnimatedSprite2D

#var state_machine: NodeStateMachine

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
	if player_character.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("tilling_front")
	elif player_character.player_direction == Vector2.UP:
		animated_sprite_2d.play("tilling_back")
	elif player_character.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("tilling_right")
	elif player_character.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("tilling_left")
	else:
		animated_sprite_2d.play("tilling_front")


func _on_exit() -> void:
	animated_sprite_2d.stop()
	
