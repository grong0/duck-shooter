class_name FrenzyTubes
extends Node2D

func _update_frenzy_tubes(num_of_frenzies):
	print("got " + str(num_of_frenzies))
	match num_of_frenzies:
		0:
			(get_child(0) as Sprite2D).texture = load("res://sprites/nixie_tubes/nixie_frenzy_off.png")
			(get_child(1) as Sprite2D).texture = load("res://sprites/nixie_tubes/nixie_frenzy_off.png")
		1:
			(get_child(0) as Sprite2D).texture = load("res://sprites/nixie_tubes/nixie_frenzy_off.png")
			(get_child(1) as Sprite2D).texture = load("res://sprites/nixie_tubes/nixie_frenzy_on.png")
		2:
			(get_child(0) as Sprite2D).texture = load("res://sprites/nixie_tubes/nixie_frenzy_on.png")
			(get_child(1) as Sprite2D).texture = load("res://sprites/nixie_tubes/nixie_frenzy_on.png")
		_:
			(get_child(0) as Sprite2D).texture = load("res://sprites/nixie_tubes/nixie_frenzy_off.png")
			(get_child(1) as Sprite2D).texture = load("res://sprites/nixie_tubes/nixie_frenzy_off.png")

func _ready():
	get_parent().connect("frenzy_updated", _update_frenzy_tubes)
