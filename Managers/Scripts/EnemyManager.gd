extends Manager

var player: CharacterBody2D

func _ready() -> void:
	super._ready()
	health_component.died.connect(_died)
	player = entity.get_parent().get_node_or_null("Player")

func _physics_process(_delta: float) -> void:
	var direction = player.global_position - entity.global_position
	movement_component.Direction = direction
	movement_component.move(entity)

func _died():
	entity.queue_free()
