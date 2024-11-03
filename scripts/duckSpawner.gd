class_name DuckSpawner
extends Node2D

@export var direction = 1
@export var z: int

func spawn_duck(duckType: Duck.DuckType):
	var duck = Duck.Duck(duckType, direction, z)
	add_child.call_deferred(duck)
