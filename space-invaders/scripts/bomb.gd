extends Projectile
class_name Bomb


func _physics_process(delta: float) -> void:
	super(delta)
	

func _on_hitbox_component_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		var hitbox : HitboxComponent = area
		
		var attack = Attack.new()
		attack.attack_damage = damage
		
		hitbox.damage(attack)
		 
	queue_free()
