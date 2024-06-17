extends CharacterBody2D

@export var speed : int = 300
@onready var animations = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("left", "right", "up", "down")
	velocity = moveDirection * speed

func updateAnimation():
	var direction = "idle"
	if velocity.x < 0: direction = "left"
	elif velocity.x > 0: direction = "right"
	elif velocity.y < 0: direction = "up"
	elif velocity.y > 0 : direction = "down"
	else: direction = "idle"
	
	animations.play("walk_" + direction)

func _physics_process(_delta):
	handleInput()
	move_and_slide()
	updateAnimation()
