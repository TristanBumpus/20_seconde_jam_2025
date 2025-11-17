extends Node

#crossair
var crossair_pos : Vector2
var fired_gun = false
var level_count = 0
@onready var color_effect = get_tree().get_first_node_in_group("color_effects")



func create_color_effect(color):
	var colors = create_tween()
	colors.tween_property(color_effect,"light_color", color, .001)
	colors.tween_property(color_effect,"light_color",Color(0.0, 0.0, 0.0, 1.0), .5)
