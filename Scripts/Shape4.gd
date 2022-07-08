extends ShapeManager

# L
class_name Shape4

var shifted = true

var half_step = Globals.half_grid_size
var full_step = Globals.grid_size + half_step

func _ready():
	
	rotation_matrix = [
		[Vector2(-full_step,-half_step), Vector2(-half_step,-half_step), Vector2(half_step,-half_step), Vector2(half_step,-full_step)],
		[Vector2(-half_step,-full_step), Vector2(-half_step,-half_step), Vector2(-half_step,half_step), Vector2(half_step,half_step)],
		[Vector2(half_step,-half_step), Vector2(-half_step,-half_step), Vector2(-full_step,-half_step), Vector2(-full_step,half_step)],
		[Vector2(-half_step,half_step), Vector2(-half_step,-half_step), Vector2(-half_step,-full_step), Vector2(-full_step,-full_step)]
	]
	
	draw_shape()
	rotate_position = 1
