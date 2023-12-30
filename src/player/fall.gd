extends State

@export
var state_idle: State
@export
var state_move: State

func enter_state() -> void:
	super()
	character.floor_snap_length = 0

func process_physics(delta: float) -> State:
	movement_comp.handle_fall(
		Input.is_action_pressed("move_left"), 
		Input.is_action_pressed("move_right"),
		delta
	)
	
	character.move_and_slide()
	
	if not character.is_on_floor():
		return null
	
	if movement_comp.direction == 0:
		return state_idle
	
	return state_move
