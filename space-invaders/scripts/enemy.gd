extends CharacterBody2D
class_name Invader

var config: Resource


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	scale = config.scale
	animated_sprite_2d.sprite_frames = config.frames
	animated_sprite_2d.name = config.animation_name
	animated_sprite_2d.play(config.animation_name, 0.5)

	
