extends Node

var grid_size = 8
var half_grid_size = grid_size / 2

var color_palette = {
	"white": "#a1ef8c",
	"light": "#3fac95",
	"dark": "#446176",
	"black": "#2c2137"	
}

var rng = RandomNumberGenerator.new()

signal inact_shape
signal add_points
signal line_clear
signal level_change

var inactive = []
var inactive_blocks = []
var points = 0
var lines_cleared = 0
var level = 0
var start_level = 0
var speed = 1

func inactivate_shape():
	emit_signal("inact_shape")
	AudioManager.play("res://Sound/Effects/land.mp3")

func line_clear():
	lines_cleared += 1
	emit_signal("line_clear")
	AudioManager.play("res://Sound/Effects/line.mp3")
	if lines_cleared % 10 == 0 and level <= 20:
		add_level()

func add_level():
	level += 1
	AudioManager.play("res://Sound/Effects/level.mp3")
	if speed > .3:
		speed -= .1
	emit_signal("level_change")

func add_points():
	points += 40 * (level + 1)
	emit_signal("add_points")

func restart_game():
	speed = 1
	points = 0
	inactive.clear()
	inactive_blocks.clear()
	get_tree().reload_current_scene()
