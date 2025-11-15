extends CharacterBody2D
@onready var crossair: Node2D = $"."
@onready var sprite: Sprite2D = $sprite

var dis
var readjusting:=false
var saved_wan_pos:Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
#	capture the mouse position the wanted position
	var wan_pos:Vector2
	var cur_pos:Vector2=global_position
	
	if !global.fired_gun and !readjusting: #when aiming //normal
		wan_pos=get_global_mouse_position()
	elif global.fired_gun :
		#print("test")
		var radius:=randf_range(50.0,100.0)
		var dirofc:=Vector2.from_angle(randf_range(-PI,PI))
		#var dirofc:=Vector2.RIGHT
		
		wan_pos=(radius*dirofc)+cur_pos
		#print(wan_pos)
		global.fired_gun=false
		readjusting=true
		saved_wan_pos=wan_pos
	elif readjusting:
		wan_pos=saved_wan_pos
		
		
		
	else:
		print("error in crossair readjusting")
	#print(wan_pos)
	var dir=get_angle_to(wan_pos)
	var speed
	if !readjusting:
		speed=20.0*cur_pos.distance_to(wan_pos)
	else:
		speed=40.0*cur_pos.distance_to(wan_pos)

	#skew fx
	var skew_dir
	var dirindeg=rad_to_deg(dir)
	#print(dir)
	dis=cur_pos.distance_to(wan_pos)
	
	var skew_force=speed/200
	
	#sprite.skew=deg_to_rad((45)*sin(2*(dir-90)))
	sprite.skew=deg_to_rad((45)*sin(2*(dir-90)))*skew_force
	
	velocity=Vector2.from_angle(dir)*speed
	if dis>1.0:
		#print("1")
		move_and_slide()
	
	else:
		#print("not")
		readjusting=false
		sprite.skew=0
#	change global for bullets and shotgun
	
	global.crossair_pos=cur_pos
