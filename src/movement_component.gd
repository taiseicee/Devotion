extends Node

@export
var speed: float = 400
@export
var speed_jump: float = 600
@export
var speed_air_multiplier: float = 0.8

@onready
var character: CharacterBody2D = $".."

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: float = 0

func handle_move(should_move_left: bool, should_move_right: bool) -> void:
	if should_move_left and should_move_right:
		character.velocity.x = -direction * speed
		return
		
	if should_move_left:
		direction = -1
	elif should_move_right:
		direction = 1
	else:
		direction = 0
	character.velocity.x = direction * speed

func handle_gravity(delta: float) -> void:
	character.velocity.y += gravity * delta

func handle_fall(should_move_left: bool, should_move_right: bool, delta: float) -> void:
	handle_gravity(delta)
	handle_move(should_move_left, should_move_right)
	character.velocity.x *= speed_air_multiplier

func handle_jump() -> void:
	character.velocity.y = -speed_jump
