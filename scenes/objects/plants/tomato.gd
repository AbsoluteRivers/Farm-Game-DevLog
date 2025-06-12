extends Node2D

var tomato_harvest_scene = preload("res://scenes/objects/collectables/tomato_fruit.tscn")

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var watering_particles: GPUParticles2D = $watering_particles
@onready var flowering_particles: GPUParticles2D = $flowering_particles
@onready var growth_cycle_component: GrowthCycleComponent = $GrowthCycleComponent
@onready var hurt_component: HurtComponent = $HurtComponent

var growth_state: DataTypes.growth_states = DataTypes.growth_states.Seed
var start_tomato_frame_offset: int = 6
#will create an offset for the frame of the sprite so it won't start at the same sprite as the corn



func _ready() -> void:
	watering_particles.emitting = false
	flowering_particles.emitting = false
	
	hurt_component.hurt.connect(on_watered)
	#registers the hurt signal from hurt component
	growth_cycle_component.crop_mature.connect(on_crop_maturity)
	growth_cycle_component.crop_harvest.connect(on_crop_harvesting)
	

func _process(delta: float) -> void:
	growth_state = growth_cycle_component.get_current_growth_state()
	sprite_2d.frame = growth_state + start_tomato_frame_offset
	
	if growth_state == DataTypes.growth_states.Mature:
		flowering_particles.emitting = true
		
	
	
	#if growth_state == DataTypes.growth_states.Harvested:
		#corn_harvest_scene.instantiate()
		#add_child(corn_harvest_scene)
		#queue_free()



func on_watered(hit_damage: int) -> void:
	if !growth_cycle_component.is_watered:
		watering_particles.emitting = true
		await get_tree().create_timer(3.0).timeout
		#will create a timer of 5 seconds
		watering_particles.emitting = false
		#after timer timeout, will return emition of water particles to false
		growth_cycle_component.is_watered = true
		print("Watered! Damage: ", hit_damage)
	


func on_crop_harvesting() -> void:
	var tomato_harvest_instance = tomato_harvest_scene.instantiate() as Node2D
	tomato_harvest_instance.global_position = global_position
	get_parent().add_child(tomato_harvest_instance)
	queue_free()

func on_crop_maturity() -> void:
	flowering_particles.emitting = true
