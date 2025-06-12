extends StaticBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: interactable_component_door = $InteractableComponent

func _ready() -> void:
	interactable_component.interactable_activated.connect(on_interactable_activated)
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	collision_layer = 1

func on_interactable_activated() -> void:
	animated_sprite_2d.play("open_door")
	collision_layer = 2
	#when collision layer is changed to 3(interactable component) it acts as a wall since it checks player collision.
	#interactable component is not physical since it is area2d while door is a staticbody2d
	
	print("activated")

func on_interactable_deactivated() -> void:
	animated_sprite_2d.play("close_door")
	collision_layer = 1
	
	print("deactivated")
	
