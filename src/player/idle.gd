extends State

@export
var state_move: State

func enter_state() -> void:
	super()
	character.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		return state_move
	return null
