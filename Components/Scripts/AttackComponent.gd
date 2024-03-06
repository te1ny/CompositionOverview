@tool
extends Area2D
class_name AttackComponent

signal attack()

const limit_damage: float = 100

var damage: float = 0
@export var Damage: float :
	get:
		return damage
	set(value):
		damage = clamp(value, 0, limit_damage)

func _ready() -> void:
	attack.connect(_attack)

func _attack() -> void:
	var potential_enemies := get_overlapping_areas()
	if potential_enemies.is_empty() == false:
		for enemy in potential_enemies:
			enemy.emit_signal("hit", damage)
