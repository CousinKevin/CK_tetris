extends Node

onready var shape1 = preload("res://Scenes/Shape1.tscn")
onready var shape2 = preload("res://Scenes/Shape2.tscn")
onready var shape3 = preload("res://Scenes/Shape3.tscn")
onready var shape4 = preload("res://Scenes/Shape4.tscn")
onready var shape5 = preload("res://Scenes/Shape5.tscn")
onready var shape6 = preload("res://Scenes/Shape6.tscn")
onready var shape7 = preload("res://Scenes/Shape7.tscn")

var shapes = []
var shape_counter = []
var sh
var nsh
var active_block = false
var num:int = 1
var next_num:int = 0

func _ready():
	shapes = [shape1, shape2, shape3, shape4, shape5, shape6, shape7]
	shape_counter = [0,0,0,0,0,0,0]
	Globals.rng.randomize()
	Globals.connect("add_points",self,"change_points")
	Globals.connect("line_clear",self,"change_cleared_lines")
	Globals.connect("level_change",self,"change_level")
	
	Globals.speed -= 0.1 * Globals.start_level
	if Globals.speed <= .3:
		Globals.speed = .3
	Globals.level = Globals.start_level + 1
	change_level()
	
	AudioManager.play("res://Sound/Music/tetris-gameboy-02.mp3")

func _on_Timer_timeout():
	$Timer.wait_time = Globals.speed
	if not active_block:
		num = Globals.rng.randi()%7 if num == -1 else next_num
		get_next_block()
		sh = shapes[num].instance()
		$Background/PlayArea.add_child(sh)
		$Background/ScoreBoard/NextBlock.frame = next_num
		if not sh.shifted:
			sh.position = Vector2(Globals.grid_size*5, Globals.grid_size*2)
		else:
			sh.position = Vector2((Globals.grid_size*5)-4, (Globals.grid_size*2)-4)
		active_block = true
	else:
		move_down()

func get_next_block():
	next_num = Globals.rng.randi()%7
	if(shape_counter[next_num-1] >= 2):
		shape_counter[next_num-1] = 0
		get_next_block()
	shape_counter[next_num-1] += 1

func move_left():
	if active_block:
		sh.move_left()

func move_right():
	if active_block:
		sh.move_right()

func move_down():
	if active_block:
		sh.move_down()
		$Timer.start()

func _input(_event):
	if sh:
		if Input.is_action_pressed("ui_right"):
			move_right()
		if Input.is_action_pressed("ui_left"):
			move_left()
		if Input.is_action_pressed("ui_down"):
			move_down()
		if Input.is_action_just_pressed("ui_up"):
			sh.rotate_it()

func change_points():
	var score = str("%06d" % Globals.points)
	$Background/ScoreBoard/Score.frame = int(score[5])
	$Background/ScoreBoard/Score2.frame = int(score[4])
	$Background/ScoreBoard/Score3.frame = int(score[3])
	$Background/ScoreBoard/Score4.frame = int(score[2])
	$Background/ScoreBoard/Score5.frame = int(score[1])
	$Background/ScoreBoard/Score6.frame = int(score[0])

func change_cleared_lines():
	var lines = str("%02d" % Globals.lines_cleared)
	$Background/ScoreBoard/Lines.frame = int(lines[1])
	$Background/ScoreBoard/Lines2.frame = int(lines[0])

func change_level():
	var level = str("%02d" % Globals.level)
	$Background/ScoreBoard/Level.frame = int(level[1])
	$Background/ScoreBoard/Level2.frame = int(level[0])
