extends Node

@export
var speed: float = 300
@export
var speed_jump: float = 400

var character: CharacterBody2D
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func init(characterBody: CharacterBody2D) -> void:
	character = characterBody

func handle_move(direction: float) -> void:
	character.velocity.x = direction * speed

func handle_gravity(delta: float) -> void:
	character.velocity.y += gravity * delta
