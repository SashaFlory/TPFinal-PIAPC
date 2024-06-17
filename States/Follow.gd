extends State
class_name Follow

@export var enemy: CharacterBody2D
@export var move_speed := 150.0

var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player")

func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 100:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
	
	if direction.length() > 400 :
		print("Pasando a estado PATROL")
		transitioned.emit(self, "Patrol")
		return
