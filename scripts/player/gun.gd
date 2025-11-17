extends CharacterBody3D


func _process(delta: float) -> void:
	
	look_at(Vector3(0, (324 - global.crossair_pos.y)/10, (576 - global.crossair_pos.x)/10))
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		print("S")
		$CanvasLayer/UI.visible = true
		var tween = create_tween()
		tween.tween_property($CanvasLayer/UI,"modulate", Color(255,255,255,1),.5)
	elif $CanvasLayer/UI.visible:
		var tween = create_tween()
		tween.tween_property($CanvasLayer/UI,"modulate", Color(255,255,255,0),.5)
		tween.tween_property($CanvasLayer/UI,"visible", false,.5)
