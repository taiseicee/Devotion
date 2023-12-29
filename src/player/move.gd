extends State

@export
var state_idle: State

func process_physics(delta: float) -> State:
	var movement: float = Input.get_axis("move_left", "move_right") * 100 
	
	if movement == 0:
		return state_idle
	
	character.velocity.x = movement
	character.move_and_slide()
	
	return null
