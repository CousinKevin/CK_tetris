extends Control

func _on_TextureButton_pressed(level_selected):
	AudioManager.play("res://Sound/Effects/pause.mp3")
	var level_nodes = get_tree().get_nodes_in_group("LevelSelect")
	var counter = 0
	for level in level_nodes:
		if counter != level_selected:
			level.pressed = false
		counter += 1
	Globals.start_level = level_selected

func _input(_event):
	if Input.is_action_pressed("ui_accept"):
		AudioManager.play("res://Sound/Effects/tetris.mp3")
		get_tree().change_scene("res://Main.tscn")
