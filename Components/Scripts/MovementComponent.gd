@tool
extends Node2D
class_name MovementComponent

const limit_speed: float = 1000

var speed: float = 0
var direction: Vector2 = Vector2.ZERO

@export var Speed: float :
	get:
		return speed
	set(value):
		speed = clamp(value, 0, limit_speed)
var Direction: Vector2 : 
	get:
		return direction
	set(value):
		if value.is_normalized():
			direction = value
		else:
			direction = value.normalized()

var is_moving = func() -> bool: return speed > 0

func move(entity: CharacterBody2D) -> void:
	entity.velocity = Direction * Speed
	entity.move_and_slide()
