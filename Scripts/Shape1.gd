extends ShapeManager

# Square
class_name Shape1

var shifted = false

var offset = Globals.grid_size

func _ready():
	
	rotation_matrix = [
		[Vector2(-offset,-offset), Vector2(0,-offset), Vector2(0,0), Vector2(-offset,0)],
		[Vector2(-offset,-offset), Vector2(0,-offset), Vector2(0,0), Vector2(-offset,0)],
		[Vector2(-offset,-offset), Vector2(0,-offset), Vector2(0,0), Vector2(-offset,0)],
		[Vector2(-offset,-offset), Vector2(0,-offset), Vector2(0,0), Vector2(-offset,0)]
	]
	
	draw_shape()
	rotate_position = 1
