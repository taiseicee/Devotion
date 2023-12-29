extends State

@export
var state_fall: State
@export
var state_idle: State
@export
var state_move: State

func enter_state() -> void:
	super()
	movement_comp.handle_jump()

func process_physics(delta: float) -> State:
	movement_comp.handle_gravity(delta)
	
	if character.velocity.y > 0:
		return state_fall
	
	movement_comp.handle_move(Input.is_action_pressed("move_left"), Input.is_action_pressed("move_right"))
	character.move_and_slide()
	
	if not character.is_on_floor():
		return null
	
	if movement_comp.direction != 0:
		return state_move
	
	return state_idle
