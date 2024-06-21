extends State
class_name Idle

@export var enemy: CharacterBody2D
@export var move_speed := 100.0
@onready var animations = $"../../AnimationPlayer"
 
var player : CharacterBody2D
var idle_timer : float

func Enter():
	player = get_tree().get_first_node_in_group("player")
	enemy.velocity = Vector2.ZERO
	idle_timer = 5.0
	animations.play("idle")

func Update(delta : float):
	if idle_timer > 0 : 
		idle_timer -= delta
		#print(idle_timer)

func Physics_Update(_delta: float):
	if idle_timer <= 0 :
		print("Pasando a estado PATROL")
		transitioned.emit(self, "Patrol")
		return
	
	var direction_player = player.global_position - enemy.global_position
	
	if direction_player.length() <= 300:
		print("Pasando a estado FOLLOW")
		transitioned.emit(self, "Follow")
