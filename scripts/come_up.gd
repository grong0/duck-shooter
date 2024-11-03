class_name ComeUp
extends Node2D

@export var duration: float
@export var start_y: float
@export var end_y: float
var total_time: float
var is_done: bool
var distance: float

func _get_time():
	return total_time / duration

func _ready():

	print(start_y)
	print(end_y)
	total_time = 0
	is_done = false
	distance = end_y - start_y

func _process(delta):
	if not is_done:
		total_time += delta
		if total_time > duration:
			is_done = true
			return
		get_parent().position.y = start_y + 3 * distance * _get_time() * _get_time() - 2 * distance * _get_time() * _get_time() * _get_time()
