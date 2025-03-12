extends Node2D

class_name Spawner

const ROWS = 5
const COLS = 11 
const X_MARGIN = 30
const X_START = 190
var X_INCRE = 15
var Y_INCRE = 30
var direction = 1
var colliding := false

var rows : Dictionary
var cols : Dictionary

@onready var movement_timer: Timer = $MovementTimer
@onready var row_interval: Timer = $RowInterval

# - Invader Configurations
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

# - Functions
func _ready() -> void:
	create_grid()

	movement_timer.timeout.connect(move_grid)



func create_grid() -> void:
	for c in COLS:
		var col_i = load("res://scripts/col_enemy.gd").new()
		cols["C" + str(c)] = col_i


	for r in ROWS:
		var row_i = load("res://scripts/row_enemy.gd").new()
		invader_config = invader_dict[r]
		rows["R" + str(r)] = []

		for c in COLS:
			var spawn_position = Vector2(X_START + (X_MARGIN * c) , Y_INCRE)
			var grid_position = {"R" + str(r): row_i, "C" + str(c): cols["C" + str(c)]}
			var enemy = spawn_enemy(invader_config, spawn_position)

			save_row(enemy, grid_position)
			save_col(enemy, grid_position)

		Y_INCRE += 45


func move_grid() -> void:
	movement_timer.stop()
	
	var row_ids = rows.keys()
	
	for i in row_ids:
		rows[i].move(X_INCRE, direction)
		check_collision()
		await get_tree().create_timer(0.15).timeout
	
	if colliding:
		position.y += 30
		direction *= -1
		colliding = false
	
	movement_timer.start()


func spawn_enemy(invader_config, spawn_pos: Vector2) -> Invader:
	var invader = invader_scene.instantiate() as Invader
	invader.config = invader_config
	invader.global_position = spawn_pos
	add_child(invader)
	
	return invader


func save_row(enemy: Invader, grid_pos: Dictionary) -> void:
	var row_id = grid_pos.keys()[0]
	var row = grid_pos[row_id]
	row.add_enemy(enemy)
	rows[row_id] = row


func save_col(enemy: Invader, grid_pos: Dictionary) -> void:
	var col_id = grid_pos.keys()[1]
	var col = grid_pos[col_id]
	col.add_enemy(enemy)


func check_collision() -> void:
	var col_ids = cols.keys()
	
	for col in col_ids:
		for e in cols[col].enemies:
			if direction < 0 and !colliding:
				colliding = e.left_wall_collision()
			elif direction > 0 and !colliding:
 				colliding = e.right_wall_collision()
