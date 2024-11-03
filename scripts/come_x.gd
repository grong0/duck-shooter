class_name ComeX
extends Node2D

@export var duration: float
@export var start_x: float
@export var end_x: float
var total_time: float
var is_done: bool
var distance: float


var did_uncome_last: bool = false

func _get_time():
	return total_time / duration

func _ready():

	print(start_x)
	print(end_x)
	total_time = 0
	is_done = true
	distance = end_x - start_x

func come():
	is_done = false
	total_time = 0

func uncome():

	is_done = false
	total_time = 0
	did_uncome_last = true

func _process(delta):
	if not is_done:
		total_time += delta
		if total_time > duration:
			if did_uncome_last:
				did_uncome_last = false
			is_done = true
			return
		if did_uncome_last:
			get_parent().position.x = end_x + -3 * distance * _get_time() * _get_time() - 2 * distance * _get_time() * _get_time() * _get_time()
		else:
			get_parent().position.x = start_x + 3 * distance * _get_time() * _get_time() - 2 * distance * _get_time() * _get_time() * _get_time()
