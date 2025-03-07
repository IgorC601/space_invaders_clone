extends Node2D

class_name Spawner

const ROWS = 5
const COLS = 1#11
const X_MARGIN = 30
const X_START = 190
const X_INCRE = 10
var Y_INCRE = 30

@onready var movement_timer: Timer = $MovementTimer

var invader_1_res = preload("res://resources/invader_1.tres")
var invader_2_res = preload("res://resources/invader_2.tres")
var invader_3_res = preload("res://resources/invader_3.tres")
var invader_4_res = preload("res://resources/invader_4.tres")
var invader_5_res = preload("res://resources/invader_5.tres")
var invader_scene =  preload("res://scenes/enemy.tscn")
var invader_config

var invader_dict = {
	0: invader_5_res,
	1: invader_4_res,
	2: invader_2_res,
	3: invader_1_res,
	4: invader_3_res,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	movement_timer.timeout.connect(move_invaders)
	
	for r in ROWS:
		invader_config = invader_dict[r]
		for c in COLS:
			var spawn_position = Vector2(X_START + (X_MARGIN * c) , Y_INCRE)
			spawn_enemy(invader_config, spawn_position)
		Y_INCRE += 45

func spawn_enemy(invader_config, spawn_pos: Vector2) -> void:
	var invader = invader_scene.instantiate() as Invader
	invader.config = invader_config
	invader.global_position = spawn_pos
	add_child(invader)
	
func move_invaders() -> void:
	var direction = 1
	position.x += X_INCRE * direction
	# Its moving now make it collide and go down and change direction
