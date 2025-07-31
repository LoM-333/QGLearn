extends Node2D

@onready var qubit = $Qubit
@onready var gate = $QuantumGate

func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_1:
				# Apply correct gate (e.g., Hadamard)
				var new_state = gate.apply_gate(qubit.state)
				qubit.apply_transformation([new_state.x, new_state.y, 0, 0])
				print("Correct gate used")
			KEY_2:
				# Simulate wrong gate — decohere the qubit
				qubit.decohere()
				print("Wrong gate used → Qubit decohered")
