class_name DuckSpawner
extends Node2D

const spawnInterval = 2/6.0

@export var direction = 1
@export var z: int
var spawnTimer := 0.0

func spawn_duck(duckType: Duck.DuckType):
	var duck = Duck.Duck(duckType, direction, z)
	add_child.call_deferred(duck)
