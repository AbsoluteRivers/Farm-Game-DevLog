class_name HurtComponent

extends Area2D


@export var tool: DataTypes.tool_set = DataTypes.tool_set.None

signal hurt(damage: int)



func _on_area_entered(area: Area2D) -> void:
	var hit_component = area as HitComponent
	#makes hit_component as a custom component of HitComponent scene
	
	if tool == hit_component.current_tool:
		#print("Tool matches, emitting on_hurt")
		hurt.emit(hit_component.hit_damage)
	#else:
		#print("Tool doesn't match")
