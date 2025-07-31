extends Node2D

@onready var qubit = $Qubit
@onready var fluid_zone = $FluidZone
@onready var measurement_zone = $MeasurementZone
@onready var phase_wheel = $PhaseWheel

func _ready():
	var screen_size = get_viewport_rect().size
	var half_height = screen_size.y / 2

	# 🟦 Fluid Zone: top half of screen
	fluid_zone.position = Vector2(0, 0)
	fluid_zone.size = Vector2(screen_size.x, half_height)

	# ⚫ Measurement Zone: bottom half of screen
	measurement_zone.position = Vector2(0, half_height)
	measurement_zone.size = Vector2(screen_size.x, half_height)

	# ⚙️ Phase Wheel: centered horizontally, in top half (fluid)
	phase_wheel.position = Vector2(screen_size.x * 0.75, half_height * 0.5)
	phase_wheel.scale = Vector2(0.5, 0.5)  # optional scaling if too big

	# 🟢 Qubit: start near left edge of fluid zone
	qubit.position = Vector2(screen_size.x * 0.2, half_height * 0.5)

func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_F:
				qubit.enter_fluid()
			KEY_R:
				qubit.apply_phase_kickback(90)
			KEY_M:
				qubit.measure()
