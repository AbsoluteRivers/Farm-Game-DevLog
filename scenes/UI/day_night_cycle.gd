extends Control


@onready var day_label: Label = $day_panel/MarginContainer/DayLabel
@onready var time_label: Label = $time_panel/MarginContainer/TimeLabel
@onready var play_button: Button = $Control/play_button

@export var normal_speed: int = 2
@export var fast_speed: int = 80

func _ready() -> void:
	play_button.grab_focus()
	DayNightCycleManager.time_tick.connect(on_time_tick)
	

func on_time_tick(day: int, hour: int, minute: int) -> void:
	
	if minute < 30:
		minute = 0
	else:
		minute = 30
	
	
	day_label.text = "DAY" + str(day)
	time_label.text = "%02d:%02d" % [hour, minute]
	



func _on_play_button_pressed() -> void:
	DayNightCycleManager.game_speed = normal_speed


func _on_time_button_pressed() -> void:
	DayNightCycleManager.game_speed = fast_speed
	


func _on_sleep_button_pressed() -> void:
	
	play_button.grab_focus()
	DayNightCycleManager.game_speed = normal_speed
	print("Sleep Button Pressed")
