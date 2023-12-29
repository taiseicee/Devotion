extends CharacterBody2D

@onready
var state_machine: Node = $state_machine

func _ready() -> void:
	state_machine.init(self)

func _process(delta) -> void:
	state_machine.process_frame(delta)

func _unhandled_input(event):
	state_machine.process_input(event)

func _physics_process(delta):
	state_machine.process_physics(delta)
