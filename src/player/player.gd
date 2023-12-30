extends CharacterBody2D

@onready
var state_machine: Node = $state_machine
@onready
var movement_comp: Node = $movement_component

func _ready() -> void:
	state_machine.init(self, movement_comp)

func _process(delta) -> void:
	state_machine.process_frame(delta)

func _unhandled_input(event):
	state_machine.process_input(event)

func _physics_process(delta):
	state_machine.process_physics(delta)

func hit_by_object(body: Node2D):
	print(body)
