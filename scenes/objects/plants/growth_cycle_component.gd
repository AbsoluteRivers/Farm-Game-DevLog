class_name GrowthCycleComponent
extends Node

@export var current_growth_state: DataTypes.growth_states = DataTypes.growth_states.Seeded
@export_range(5, 365) var days_until_harvest: int = 7
#export range will range from 5 to 365 for the number of days with days_until_harvest having a default of 7

signal crop_mature
signal crop_harvest

var is_watered: bool
var starting_day: int
var current_day: int

func _ready() -> void:
	DayNightCycleManager.time_tick_day.connect(on_time_tick_day)
	

func on_time_tick_day(day: int) -> void:
	#implicitly returning void in gdscript means that the function will not return a value
	
	if is_watered:
		if starting_day == 0:
			starting_day = day
		
		growth_states(starting_day, day)
		harvest_state(starting_day, day)


func growth_states(starting_day: int, current_day: int):
	if current_growth_state == DataTypes.growth_states.Mature:
		return
	
	var num_states = 5
	
	var growth_days_passed = (current_day - starting_day) % num_states
	var state_index = growth_days_passed % num_states + 1
	
	current_growth_state = state_index
	
	var name = DataTypes.growth_states.keys()[current_growth_state]
	print("current state: ", name, ", state index: ", state_index)
	
	if current_growth_state == DataTypes.growth_states.Mature:
		crop_mature.emit()
	

func harvest_state(starting_day: int, current_day: int) -> void:
	if current_growth_state == DataTypes.growth_states.Harvested:
		return
	
	var days_passed = (current_day - starting_day) % days_until_harvest
	
	if days_passed == days_until_harvest - 1:
		current_growth_state = DataTypes.growth_states.Harvested
		crop_harvest.emit()
		

func get_current_growth_state() -> DataTypes.growth_states:
	return current_growth_state
	#returns implicitly growth states from the DataTypes global script
