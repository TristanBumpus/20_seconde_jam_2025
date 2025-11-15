extends CharacterBody3D

#set up
@export_enum("type 1(to Change name)") var enemiy_type

#effects
@onready var color_effect = get_tree().get_first_node_in_group("color_effects")

#physics
var gravity = -9.8

#combat
@export var clickable = false

func _ready() -> void:
	
	if enemiy_type == 0:
		$timers/when_to_shoot.start(1)

func _process(delta: float) -> void:
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and clickable:
		death()
	
	velocity.y = gravity
	
	move_and_slide()



func death():
	queue_free()



func _on_when_to_shoot_timeout() -> void:
	global.create_color_effect(Color(9.112, 0.001, 0.0, 1.0))


func _on_area_3d_mouse_entered() -> void:
	clickable = true


func _on_area_3d_mouse_exited() -> void:
	clickable = false
