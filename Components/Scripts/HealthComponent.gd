@tool
extends Node2D
class_name HealthComponent

signal initialize()
signal health_changed(isDamage: bool)
signal died()

const limit_health: float = 100

var max_health: float = 10
var current_health: float
var previous_health: float

@export var Max_Health: float :
	get:
		return max_health

	set(value):
		max_health = clamp(value, 0, limit_health)
var Current_Health: float :
	get:
		return current_health

	set(value):
		previous_health = Current_Health
		current_health = clamp(value, 0, Max_Health)
		
		if alive.call():
			emit_signal("health_changed", is_damage)
		else:
			emit_signal("died")

var alive = func() -> bool: return current_health > 0
var is_damage = func() -> bool: return current_health < previous_health

func _ready() -> void:
	initialize.connect(_initialize)
	emit_signal("initialize")

func _initialize():
	Current_Health = Max_Health

func damage(value: float) -> void:
	Current_Health -= value
	
func heal(value: float) -> void:
	Current_Health += value
