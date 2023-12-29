extends State

@export
var state_fall: State
@export
var state_move: State

func enter_state() -> void:
	super()
	character.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		return state_move
	return null
	
func process_physics(delta: float) -> State:
	movement_comp.handle_gravity(delta)
	character.move_and_slide()
	
	if not character.is_on_floor():
		return state_fall
	
	return null
