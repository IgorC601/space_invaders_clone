extends CharacterBody2D

const SPEED = 300.0

@onready var stage = get_tree().get_root().get_node("Stage1")
@onready var bullet_scene = load("res://scenes/bullet.tscn")

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# - Moving
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# - Shooting
	var shoot := Input.is_action_just_pressed("attack")
	if shoot:
		bullet_attack()

	move_and_collide(velocity * delta)

func bullet_attack() -> void:
	var bullet = bullet_scene.instantiate() as Bullet
	bullet.position = Vector2(position.x, position.y - 30)
	stage.add_child.call_deferred(bullet)
	
