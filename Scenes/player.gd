extends CharacterBody2D

@export var speed : int = 300
@onready var animations = $AnimationPlayer
@onready var hitbox_right = $Area2D/CollisionShape2D
@onready var hitbox_left = $Area2D/CollisionShape2D2
var cantidad_enemigos = 0

func _ready():
	print("Enemigos derrotados: ",cantidad_enemigos)

func _process(_delta):
	if Input.is_mouse_button_pressed(1):
		if velocity.x >= 0:
			hitbox_right.disabled = false
			animations.play ("attack_right")
		elif velocity.x <= 0:
			animations.play("attack_left")
			hitbox_left.disabled = false 
	else:
		hitbox_right.disabled = true
		hitbox_left.disabled = true

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

func _on_area_2d_body_entered(body):
	if body.is_in_group("Hit"):
		body.TakeDamage()
		cantidad_enemigos = cantidad_enemigos + 1
		print("Enemigos derrotados: ", cantidad_enemigos)
	
		if cantidad_enemigos >= 3:
			get_tree().change_scene_to_file("res://Scenes/menu_ganar.tscn")
	else:
		pass
