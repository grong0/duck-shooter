class_name Session
extends Node2D

signal session_completed

@export var ROUND_TIME: int = 5 # seconds
var total_time: int

var round_num: int
var frenzy_count: int
var points: int

func _ready():
	total_time = 0
	round_num = 1
	frenzy_count = 0
	points = 0

func _process(delta):
	if round_num < 6:
		total_time += delta
		if total_time > ROUND_TIME:
			round_num += 1
			total_time -= ROUND_TIME

		if round_num > 5:
			session_completed.emit()
