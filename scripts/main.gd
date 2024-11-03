class_name Main
extends Node2D

var total_time: int # seconds
var session: Session

func _on_duck_destroyed(duck: Duck):
	if session != null:
		session.points += duck.points
		print(session.points)

func _on_session_complete():
	print(session.round)
	print(session.frenzy_count)
	print(session.points)

func _ready():
	total_time = 0
	session = Session.new()
	var crosshair = get_node("Crosshair")
	crosshair.connect("duck_destroyed", _on_duck_destroyed)
	session.connect("session_completed", _on_session_complete)

# func _process(delta):
# 	pass
