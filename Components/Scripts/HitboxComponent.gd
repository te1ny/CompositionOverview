extends Area2D
class_name HitboxComponent

signal hit(value: float)
var health_component: HealthComponent

func _ready():
	hit.connect(_hit)
	health_component = get_parent().get_node("HealthComponent")

func _hit(value: float) -> void:
	health_component.damage(value)
