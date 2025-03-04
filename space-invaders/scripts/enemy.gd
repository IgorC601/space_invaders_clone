extends CharacterBody2D

class_name Invader

var config: Resource

func _ready() -> void:
	$AnimatedSprite2D.sprite_frames = config.frames
