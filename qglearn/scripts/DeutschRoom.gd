extends Node2D

@onready var qubit = $Qubit
@onready var fluid_zone = $FluidZone
@onready var measurement_zone = $MeasurementZone

func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_F:
				qubit.enter_fluid()
			KEY_R:
				qubit.apply_phase_kickback(90)
			KEY_M:
				qubit.measure()
