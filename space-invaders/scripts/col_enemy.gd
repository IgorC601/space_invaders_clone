extends Node2D
class_name Columns

var enemies: Array[Invader]

func add_enemy(enemy: Invader) -> void:
	enemies.append(enemy)

func remove_enemy(enemy: Invader) -> void:
	enemies.erase(enemy)
