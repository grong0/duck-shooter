extends Node2D

const spawnInterval = 2

var direction = 1
var spawnTimer := 0.0

func _process(delta):
	spawnTimer += delta
	if(spawnTimer > spawnInterval):
		spawn_duck(Duck.DuckType.YELLOW);
		spawnTimer -= spawnInterval;

func spawn_duck(duckType: Duck.DuckType):
	var duck = Duck.Duck(duckType, direction)
	add_child.call_deferred(duck)
