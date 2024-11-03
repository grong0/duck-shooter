class_name Motion
extends Node2D

var total_time: float

func _get_x_mod(time: float) -> float:
	return 0.5 * sin(4 * time + 1) + 0.25 * cos(7 * time + 1)

func _get_y_mod(time: float) -> float:
	return 0.33 * cos(3 * time - 4) + 0.25 * sin(4 * time + 4)

func _get_r_mod(time: float) -> float:
	return 0.125 * sin(1.4 * time) + 0.115 * cos(1.3 * time + 1)

func _ready():
	total_time = randi() % 100

func _process(delta):
	total_time += delta

	get_parent().position.x += _get_x_mod(total_time)
	get_parent().position.y += _get_y_mod(total_time)
	get_parent().rotation_degrees += _get_r_mod(total_time)
