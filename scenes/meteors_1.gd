extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

signal collision

func _ready():
	var rng := RandomNumberGenerator.new()
	
	var path: String = "res://graphics/"+ str(rng.randi_range(1,4)) +".png"
	$Meteor_1.texture = load(path)
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(280, (width-280))
	var random_y = rng.randi_range(-50, -10)
	position = Vector2(random_x, random_y)
	
	speed = rng.randi_range(200, 400)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)
	
func _process(delta):
	position += Vector2(direction_x, 1) * speed * delta
	rotation_degrees += rotation_speed * delta
	
func _on_body_entered(body):
	collision.emit()


func _on_area_entered(area):
	area.queue_free()
	queue_free()
