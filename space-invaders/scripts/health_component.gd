extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 3
var health: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX_HEALTH

func damage(attack: Attack) -> void:
	health -= attack.attack_damage
	
	if health <= 0:
		death()

func death() -> void:
	get_parent().queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
