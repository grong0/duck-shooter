class_name Save

static func save(leaderboard: Dictionary) -> void:
	print("triggered save")
	var file = FileAccess.open("user://scores.json", FileAccess.WRITE)
	var json_string = JSON.stringify(leaderboard)
	file.store_string(json_string)

static func load() -> Dictionary:
	print("triggered load")
	if not FileAccess.file_exists("user://scores.json"):
		print("file didnt exist")
		return {"scores": []}
	var file = FileAccess.open("user://scores.json", FileAccess.READ)
	var json = JSON.new()
	var parse_result = json.parse(file.get_line())
	if parse_result != OK:
		print("failed to parse file")
		return {"scores": []}
	return json.data
