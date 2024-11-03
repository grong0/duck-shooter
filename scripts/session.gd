class_name Session
extends Node2D

signal session_completed
signal start_round_transition

@export var ROUND_TIME: int = 30 # seconds
var total_time: float

var round_num: int
var frenzy_count: int
var points: int
var frenzy_node: Frenzy
var duck_pool: DuckPool

func add_points(value: int) -> void:
	points += value * (2 if frenzy_node.enabled else 1)

func _on_duck_destroyed(duck: Duck):
	add_points(duck.points)
	if duck.duck_type == Duck.DuckType.GOLDEN:
		frenzy_count += 1 if frenzy_count < 2 else 0
	print(points)
	print(frenzy_count)

func _ready():
	total_time = ROUND_TIME + 1;
	round_num = -1
	frenzy_count = 1
	points = 0
	frenzy_node = get_node("Frenzy")
	duck_pool = get_node("DuckPool")

	var crosshair_node = get_node("Crosshair")
	crosshair_node.connect("duck_destroyed", _on_duck_destroyed)

	

func _process(delta):
	if round_num >= 5:
		return

	total_time += delta
	if total_time > ROUND_TIME:
		round_num += 1
		total_time -= ROUND_TIME
		duck_pool.running = false
		if round_num < 5:
			start_round_transition.emit(round_num)
		else:
			print("session_ending...")
			session_completed.emit()


func next_round():
	duck_pool.startRound(round_num)
	print("rounded ended, now round " + str(round_num + 1))
	
