class_name Frenzy
extends Node2D

@export var DURATION: int = 5
var enabled: bool
var time_enabled: float

func _on_frenzy_activated():
	if get_parent().frenzy_count < 1:
		return

	get_parent().frenzy_count -= 1
	enabled = true
	time_enabled = 0
	get_parent().frenzy_updated.emit(get_parent().frenzy_count)

	get_child(0).get_child(0).come()

	print("frenzy started")

func _ready():
	enabled = false

	var crosshair_node = get_node("../Crosshair")
	crosshair_node.connect("frenzy_activated", _on_frenzy_activated)

func _process(delta):
	if not enabled:
		return

	if time_enabled > DURATION:
		enabled = false
		get_child(0).get_child(0).uncome()
		print("frenzy over")
	else:
		time_enabled += delta
