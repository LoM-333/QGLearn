extends Node2D

# Qubit state vector: starts in |0> state
var state = Vector2(1, 0)

func _ready():
	update_visual()

func apply_transformation(matrix: PackedFloat32Array):
	var new_x = matrix[0] * state.x + matrix[1] * state.y
	var new_y = matrix[2] * state.x + matrix[3] * state.y
	state = Vector2(new_x, new_y).normalized()
	update_visual()

func update_visual():
	# Visualize state by rotating the sprite
	$Sprite2D.rotation = atan2(state.y, state.x)

var is_decohered = false

func decohere():
	is_decohered = true
	$Sprite2D.modulate = Color(1, 0.2, 0.2, 0.5)  # faded red, semi-transparent
	rotation = 0
	print("Qubit has decohered!")
