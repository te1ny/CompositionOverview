extends Manager

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("a", "d", "w", "s")
	movement_component.Direction = direction
	movement_component.move(entity)
	
	if Input.is_action_just_pressed("lcm"):
		attack_component.emit_signal("attack")
	
