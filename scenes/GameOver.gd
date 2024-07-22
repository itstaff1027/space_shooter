extends Control

@export var level_scene: PackedScene = load("res://scenes/level.tscn")

func _ready():
	$CenterContainer/VBoxContainer/Label.text = $CenterContainer/VBoxContainer/Label.text + str(Global.score)

#func _process(_delta):
	#if Input.is_action_pressed("pew"):
		##print("Restart")
		#get_tree().change_scene_to_packed(level_scene)

func _input(event):
	if event.is_action_pressed("pew"):
		get_tree().change_scene_to_packed(level_scene)
