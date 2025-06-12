class_name DayNightCycleComponent

extends CanvasModulate


@export var initial_day: int = 1:
	set(int_d):
		initial_day = int_d
		DayNightCycleManager.initial_day = int_d
		DayNightCycleManager.set_initial_time()
		

@export var initial_hour: int = 12:
	set(int_h):
		initial_hour = int_h
		DayNightCycleManager.initial_hour = int_h
		DayNightCycleManager.set_initial_time()


@export var initial_minute: int = 30:
	set(int_m):
		initial_minute = int_m
		DayNightCycleManager.initial_minute = int_m
		DayNightCycleManager.set_initial_time()

@export var day_night_gradient_texture: GradientTexture1D

func _ready() -> void:
	DayNightCycleManager.initial_day = initial_day
	DayNightCycleManager.initial_hour = initial_hour
	DayNightCycleManager.initial_minute = initial_minute
	
	DayNightCycleManager.game_time.connect(on_game_time)
	


func on_game_time(time: float) -> void:
	#gets the time from the DayNightCycleManager global script
	var sample_value = 0.5 * (sin(time - PI * 0.5) + 1.0)
	#uses a sine wave function to oscillate the value between 0 and 1
	color = day_night_gradient_texture.gradient.sample(sample_value)
	#color is property of CanvasModulate
	#sample_value will be used to sample the color from the gradient text
