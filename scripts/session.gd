class_name Session
extends Node2D

signal session_completed

@export var ROUND_TIME: int = 10 # seconds
var total_time: float

var round_num: int
var frenzy_count: int
var points: int
var frenzy_node: Frenzy

func add_points(value: int) -> void:
	points += value * (2 if frenzy_node.enabled else 1)

func _on_duck_destroyed(duck: Duck):
	add_points(duck.points)
	if is_instance_of(duck.DuckType, Duck.DuckType.GOLDEN):
		frenzy_count += 1 if frenzy_count <= 2 else 0
	print(points)
	print(frenzy_count)

func _ready():
	total_time = 0
	round_num = 0
	frenzy_count = 1
	points = 0
	frenzy_node = get_node("Frenzy")

	var crosshair_node = get_node("Crosshair")
	crosshair_node.connect("duck_destroyed", _on_duck_destroyed)

	print("session started, round " + str(round_num + 1))

func _process(delta):
	if round_num >= 5:
		return

	total_time += delta
	if total_time > ROUND_TIME:
		round_num += 1
		total_time -= ROUND_TIME
		print("rounded ended, now round " + str(round_num + 1))

	if round_num > 4:
		print("session_ending...")
		session_completed.emit()
