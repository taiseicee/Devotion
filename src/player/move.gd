extends State

@export
var state_fall: State
@export
var state_idle: State
@export
var state_jump: State

func enter_state() -> void:
	super()
	character.floor_snap_length = 10

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and character.is_on_floor():
		return state_jump
	return null

func process_physics(delta: float) -> State:
	movement_comp.handle_gravity(delta)
	movement_comp.handle_move(
		Input.is_action_pressed("move_left"), 
		Input.is_action_pressed("move_right")
	)
	
	if movement_comp.direction == 0:
		return state_idle
	
	character.move_and_slide()
	
	if not character.is_on_floor():
		return state_fall
	
	return null
