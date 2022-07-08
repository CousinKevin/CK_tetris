extends ShapeManager

# Line
class_name Shape2

var shifted = false

var offset = Globals.grid_size

func _ready():
	
	rotation_matrix = [
		[Vector2(-(2*offset),-offset), Vector2(-offset,-offset), Vector2(0,-offset), Vector2(offset,-offset)],
		[Vector2(0,-(2*offset)), Vector2(0,-offset), Vector2(0,0), Vector2(0,offset)],
		[Vector2(-(2*offset),0), Vector2(-offset,0), Vector2(0,0), Vector2(offset,0)],
		[Vector2(-offset,-(2*offset)), Vector2(-offset,-offset), Vector2(-offset,0), Vector2(-offset,offset)]
	]
	
	draw_shape()
	rotate_position = 1
