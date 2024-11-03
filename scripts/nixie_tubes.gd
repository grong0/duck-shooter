class_name NixieTubes
extends Node2D

func _update_nixie_tubes(new_score: int):
	var str_score = str(new_score)

	for i in range(0, len(str_score)):
		(get_child(i) as Sprite2D).texture = load("res://sprites/nixie_tubes/nixie_" + str(str_score[(i+1) * -1]) + ".png")

func _ready():
	get_node("../../../Session").connect("updated_points", _update_nixie_tubes)
