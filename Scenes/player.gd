extends CharacterBody2D

@export var speed : int = 300
@onready var animations = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("left", "right", "up", "down")
	velocity = moveDirection * speed

func updateAnimation():
	var direction = "idle"
	if velocity.x < 0: direction = "walk_left"
	elif velocity.x > 0: direction = "walk_right"
	elif velocity.y < 0: direction = "walk_up"
	elif velocity.y > 0 : direction = "walk_down"
	else:
		direction = "idle"
	animations.play(direction)

func _physics_process(_delta):
	handleInput()
	move_and_slide()
	updateAnimation()
