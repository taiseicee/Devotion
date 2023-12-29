class_name State
extends Node
## Basic Template for the State class.
##
## This is based off of Shaggy Dev's Godot-Based State Machine.
## More info in README

var character: CharacterBody2D

# TODO: Animation functionality
# TODO: Movement Component

func enter_state() -> void:
	# TODO: start animation upon enter
	pass

func exit_state() -> void:
	pass

func process_frame(delta: float) -> State:
	return null

func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
