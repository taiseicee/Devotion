extends StaticBody2D

@export
var speed: float = 300
@export
var should_move: bool = false
@export
var point_end: Vector2

var point_start: Vector2
var direction: Vector2

func _ready() -> void:
	point_start = position
	direction = (point_end - point_start).normalized()
	constant_linear_velocity = direction * speed

func _process(delta) -> void:
	if not should_move or point_start == point_end:
		return
	var current_direction = (point_end - position).normalized()
	if direction.x * current_direction.x > 0 and direction.y * current_direction.y > 0 :
		position += direction * speed * delta
		return
	var new_point_end = point_start
	point_start = point_end
	point_end = new_point_end
	direction = (point_end - point_start).normalized()
	constant_linear_velocity = direction * speed

func _on_area_2d_body_entered(body):
	body.hit_by_object(self)
