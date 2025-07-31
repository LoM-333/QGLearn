extends Node2D

# Hadamard gate transformation
func apply_gate(state: Vector2) -> Vector2:
	var inv_sqrt2 = 1.0 / sqrt(2)
	var new_x = inv_sqrt2 * (state.x + state.y)
	var new_y = inv_sqrt2 * (state.x - state.y)
	return Vector2(new_x, new_y).normalized()
