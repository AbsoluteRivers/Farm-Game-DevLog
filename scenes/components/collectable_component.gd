class_name CollectableComponent

extends Area2D

@export var collectable_name: String



func _on_body_entered(body: Node2D) -> void:
	if body is Player_Character:
		InventoryManager.add_collectable(collectable_name)
		print("Collected: ", collectable_name)
		get_parent().queue_free()
		
		#checks if body that collides with the area2d is the player and returns boolean value
		#if yes, the parent item is "freed" from game
