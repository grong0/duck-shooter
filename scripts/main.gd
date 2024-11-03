class_name Main
extends Node2D

var total_time: int # seconds
var session: Session
var scores: Dictionary

func _on_duck_destroyed(duck: Duck):
	if session != null:
		session.points += duck.points
		print(session.points)

func _on_session_complete():
	var username = "TST"

	scores['scores'].append({
		"name": username,
		"score": session.points
	})
	Save.save(scores)

func _ready():
	total_time = 0
	session = Session.new()
	scores = Save.load()
	print(scores)
	var crosshair_node = get_node("Crosshair")
	var session_node = get_node("Session")
	crosshair_node.connect("duck_destroyed", _on_duck_destroyed)
	session_node.connect("session_completed", _on_session_complete)

# func _process(delta):
# 	pass
