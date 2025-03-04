extends Area2D
class_name HitboxComponent

@export var health_component: HealthComponent

# Try to make a signal to the parent 

func damage(attack: Attack) -> void:
	if health_component:
		health_component.damage(attack)
