class_name Main
extends Node2D

var total_time: int # seconds
var session: Node2D
var scores: Dictionary

func _on_session_complete():
	var username = "TST"

	scores['scores'].append({
		"name": username,
		"score": session.points
	})
	Save.save(scores)

func _ready():
	session = load("res://session.tscn").instantiate()
	add_child(session)
	scores = Save.load()
	print(scores)

	var session_node = get_node("Session")
	session_node.connect("session_completed", _on_session_complete)

# func _process(delta):
# 	pass
