extends State
class_name Attack

@export var enemy: CharacterBody2D
@export var move_speed := 150.0
@onready var animations = $"../../AnimationPlayer"
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player")

	enemy.velocity = Vector2.ZERO
	
func Physics_Update(_delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 100:
		enemy.velocity = direction.normalized() * move_speed
	#else:
		#enemy.velocity = Vector2()
	
	if direction.x > 0:
		animations.play("attack_right")
	elif direction.x < 0:
		animations.play("attack_left")
	elif direction.y > 0:
		animations.play("attack_down")
	elif direction.y < 0:
		animations.play("attack_up")
		
	if direction.length() > 100 :
		print("Pasando a estado FOLLOW")
		transitioned.emit(self, "Follow")
		return


