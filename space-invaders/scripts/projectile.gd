extends CharacterBody2D
class_name Projectile

@export var damage := 1.0
@export var dir := -1.0
const SPEED := 300.0

func _physics_process(delta: float) -> void:
	var direction := Vector2(0, dir)
	velocity = direction * SPEED
	move_and_collide(velocity * delta)

#func _on_hitbox_component_area_entered(area: Area2D) -> void:
	#if area is HitboxComponent:
		#var hitbox : HitboxComponent = area
		#
		#var attack = Attack.new()
		#attack.attack_damage = damage
		#
		#hitbox.damage(attack)
		 #
	#queue_free()
