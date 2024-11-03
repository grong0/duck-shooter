class_name DuckPool
extends Node2D

var pool: Array

var pools = [
	[45, 10, 5, 0],
	[56, 24, 12, 2],
	[56, 24, 12, 2],
	[56, 24, 12, 2],
	[56, 24, 12, 2],
]

var spawnDelay = 2
var roundTimer: float = 0
var running = false
var duckSpawnerIndex

func fillPool(round_num: int):
	for i in range(0, 4):
		for j in range(0, pools[round_num][i]):
			pool.append(i)

func getDuck():
	if pool.size() == 0:
		return 0
	var index = randi() % pool.size()
	return pool.pop_at(index)

func startRound(round_num: int):
	running = true
	Duck.globalSpeedMult = 1 * pow(1.2, round_num)
	fillPool(round_num)
	roundTimer = 0
	spawnDelay = 2 / pow(1.2, round_num * 2)
	duckSpawnerIndex = 0

func _process(delta):
	if not running:
		return

	roundTimer += delta
	while (roundTimer >= spawnDelay / 4):
		duckSpawnerIndex += 1
		duckSpawnerIndex %= 4
		(get_child(duckSpawnerIndex) as DuckSpawner).spawn_duck(getDuck())
		roundTimer -= spawnDelay / 4 + randf_range(-0.2, .2)
