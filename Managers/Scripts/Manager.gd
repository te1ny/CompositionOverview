extends Node2D
class_name Manager

var entity: CharacterBody2D
var health_component: HealthComponent
var movement_component: MovementComponent
var attack_component: AttackComponent
var hitbox_component: HitboxComponent

func _ready() -> void:
	entity = get_parent()
	health_component = entity.get_node("HealthComponent")
	movement_component = entity.get_node("MovementComponent")
	attack_component = entity.get_node("AttackComponent")
	hitbox_component = entity.get_node("HitboxComponent")
