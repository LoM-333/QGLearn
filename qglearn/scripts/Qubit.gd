extends Node2D

var state = Vector2(1, 0)
var is_in_fluid = false

@onready var sprite = $Visual  # ✅ This now matches your node name
@onready var decoherence_timer = $DecoherenceTimer

func enter_fluid():
	if is_in_fluid: return
	is_in_fluid = true
	sprite.modulate = Color(0.7, 0.7, 1, 0.6)  # bluish and semi-transparent
	decoherence_timer.start()
	print("Qubit entered fluid - superposition state")

func apply_phase_kickback(angle_degrees):
	rotation += deg_to_rad(angle_degrees)
	print("Qubit rotated by phase kickback")

func measure():
	var result = randi() % 2
	sprite.modulate = Color(1, 1, 1) if result == 0 else Color(0, 0, 0)
	print("Measurement result: %d" % result)

func _on_DecoherenceTimer_timeout():
	print("Decoherence occurred - Qubit lost")
	queue_free()
