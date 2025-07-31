extends Node2D

@onready var qubit = $Qubit
@onready var gate = $QuantumGate

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		var new_state = gate.apply_gate(qubit.state)
		qubit.apply_transformation([new_state.x, new_state.y, 0, 0]) # simplified pass
