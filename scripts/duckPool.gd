class_name DuckPool
extends Node2D

var pool: Array

var pools = [
	[45, 10, 5, 0],
	[56, 24, 12, 2]
]

var spawnDelay = 2
var roundTimer: float = 0;
var running = false;
var duckSpawnerIndex;

func fillPool(round: int):
	for i in range(0, 4):
		for j in range(0, pools[round][i]):
			pool.append(i)

func getDuck():
	var index = randi() % pool.size()
	return pool.pop_at(index)

func startRound(round: int):
	running = true;
	Duck.globalSpeedMult = 1 * pow(1.2, round);
	fillPool(round);
	roundTimer = 0
	spawnDelay = 2 / pow(pow(1.2, round), 2)
	duckSpawnerIndex = 0;

func process(delta):
	if(running):
		roundTimer += delta
		while(roundTimer <= spawnDelay / 4):
			duckSpawnerIndex += 1 
			duckSpawnerIndex %= 4
			(get_child(duckSpawnerIndex) as DuckSpawner).spawn_duck(getDuck())
			roundTimer -= spawnDelay


