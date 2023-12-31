extends StaticBody2D

@export
var speed: float = 450
@export
var direction: Vector2

func _ready():
	if not direction.is_normalized():
		direction = direction.normalized()
	rotation = direction.angle()

func _process(delta):
	constant_linear_velocity = direction * speed
	position += constant_linear_velocity * delta
