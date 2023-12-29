extends State

@export
var state_idle: State
@export
var state_move: State

func process_physics(delta: float) -> State:
	movement_comp.handle_gravity(delta)
	character.move_and_slide()
	
	if character.is_on_floor():
		return state_idle
	return null
