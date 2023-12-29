extends Node
## Basic Template for the State class.
##
## This is based off of Shaggy Dev's Godot-Based State Machine.
## More info in README

@export
var starting_state: State

var current_state: State

func init(character: CharacterBody2D) -> void:
	for state in get_children():
		state.character = character
	
	change_state(starting_state)

func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit_state()
	
	current_state = new_state
	current_state.enter_state()

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
