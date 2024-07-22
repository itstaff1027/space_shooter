extends Node2D

var metoer_scene: PackedScene = load("res://scenes/meteors_1.tscn")
var pew_scene: PackedScene = load("res://scenes/pew.tscn")

var health: int = 3

func _ready():
	get_tree().call_group('ui', 'set_health', health)
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $Stars_Blinking.get_children():
		var random_x = rng.randi_range(0, int(size.x))
		var random_y = rng.randi_range(0, int(size.y))
		
		star.position = Vector2(random_x, random_y)
		
		var random_scale = rng.randf_range(0.2, 1)
		star.scale = Vector2(random_scale, random_scale)
		
		star.speed_scale = rng.randf_range(0.1, 1.5)
		


func _on_timer_timeout():
	var meteor = metoer_scene.instantiate()
	
	$metoers.add_child(meteor)
	
	meteor.connect('collision', _on_meteor_collision)


func _on_meteor_collision():
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

func _on_player_pew(pos):
	var pew = pew_scene.instantiate()
	$Pew.add_child(pew)
	pew.position = pos	
