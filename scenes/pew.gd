extends Area2D

@export var speed = 500

func _ready():
	var tween = create_tween()
	tween.tween_property($pewImage, 'scale', Vector2(2, 3), 0.4).from(Vector2(0.2, 1.2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta
