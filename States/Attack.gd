extends State
class_name Attack

@export var enemy: CharacterBody2D
var player: CharacterBody2D

@onready var animations = $"../../AnimationPlayer"

func Enter():
	player = get_tree().get_first_node_in_group("player")
	enemy.velocity = Vector2.ZERO
	
func Physics_Update(_delta: float):
	var direction = player.global_position - enemy.global_position

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


