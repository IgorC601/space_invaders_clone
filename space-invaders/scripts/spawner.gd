extends Node2D

class_name Spawner

const ROWS = 5
const COLS = 11
const X_MARGIN = 32
const Y_MARGIN = 32
const Y_START = 400
const X_INCRE = 50
const Y_INCRE = 20

var invader_1_res = preload("res://resources/invader_1.tres")
var invader_2_res = preload("res://resources/invader_2.tres")
var invader_3_res = preload("res://resources/invader_3.tres")
var invader_4_res = preload("res://resources/invader_4.tres")
var invader_5_res = preload("res://resources/invader_5.tres")
var invader_scene =  preload("res://scenes/enemy.tscn")
var invader_config

var invader_dict = {
	0: invader_1_res,
	1: invader_2_res,
	2: invader_3_res,
	3: invader_4_res,
	4: invader_5_res,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for r in ROWS:
		invader_config = invader_dict[r]
		for c in COLS:
			var spawn_position = Vector2(X_MARGIN + (X_INCRE * c), Y_MARGIN + (Y_INCRE * c))
			spawn_enemy(invader_config, spawn_position)
		# THEY ARE SHOWING, BUT THE POSITION IS NOT RIGHT

func spawn_enemy(invader_config, spawn_pos: Vector2) -> void:
	var invader = invader_scene.instantiate() as Invader
	invader.config = invader_config
	invader.global_position = spawn_pos
	add_child(invader)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
