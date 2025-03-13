extends Node2D
class_name Row

var enemies : Array[Invader]

func move(x_incre: int, direction: int) -> void:
	for e in enemies:
		e.position.x += x_incre * direction

func add_enemy(enemy: Invader) -> void:
	enemies.append(enemy)

func remove_enemy(enemy: Invader) -> void:
	enemies.erase(enemy)
