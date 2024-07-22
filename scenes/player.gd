extends CharacterBody2D

@export var speed := 700
var can_pew: bool = true

signal pew(pos)

# Called when the node 	enters the scene tree for the first time.
func _ready():
	position = Vector2(572, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if can_pew:
		pew.emit($PewStart.global_position)
		can_pew = false
		$PewTimer.start()

func _on_pew_timer_timeout():
	can_pew = true
