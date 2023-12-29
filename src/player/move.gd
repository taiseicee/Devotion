extends State

@export
var state_fall: State
@export
var state_idle: State

func process_physics(delta: float) -> State:
	movement_comp.handle_gravity(delta)
	var direction: float = Input.get_axis("move_left", "move_right")
	
	if direction == 0:
		return state_idle
	
	movement_comp.handle_move(direction)
	character.move_and_slide()
	
	if not character.is_on_floor():
		return state_fall
	
	return null
