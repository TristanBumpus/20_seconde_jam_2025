extends Node3D

var levels_dir = DirAccess.get_files_at("res://scenes/realm/level/")
var levels
var current_level = -1


func _ready() -> void:
	var temp = levels_dir.size()
	levels = []
	while temp:
		temp -= 1
		var temp2 = levels_dir[temp]
		if temp2.ends_with(".remap"):
			var temp3 = temp2.split(".")
			temp2 = temp3[0] + "." + temp3[1]
		levels += ["res://scenes/realm/level/" + temp2]
	

func _process(delta: float) -> void:
	if current_level != global.level_count:
		if global.level_count < levels.size()  :
			current_level = global.level_count
			var l = load(levels[global.level_count])
			var level = l.instantiate()
			level.global_position =  $StaticBody3D.global_position
			get_tree().current_scene.add_child(level)
