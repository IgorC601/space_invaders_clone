extends CharacterBody2D
class_name Invader

var config: Resource
var colliding := false

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var left_ray_cast: RayCast2D = $LeftRayCast
@onready var right_ray_cast: RayCast2D = $RightRayCast


func _ready() -> void:
	scale = config.scale
	animated_sprite_2d.sprite_frames = config.frames
	animated_sprite_2d.name = config.animation_name
	left_ray_cast.target_position = config.left_ray_vec
	right_ray_cast.target_position = config.right_ray_vec
	animated_sprite_2d.play(config.animation_name, 0.5)


func left_wall_collision() -> bool:
	if left_ray_cast.is_colliding():
		print("Colliding with Left Wall")
		return true
	else:
		return false
	
func right_wall_collision() -> bool:
	if right_ray_cast.is_colliding():
		print("Colliding with Right Wall")
		return true
	else:
		return false
