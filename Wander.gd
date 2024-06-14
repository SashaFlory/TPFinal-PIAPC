extends Node3D

@export var target_group : String

var positions = []
var temp_positions = []
var current_position : Marker3D

var direction : Vector3 = Vector3.ZERO

func _ready():
	positions = get_tree().get_nodes_in_group(target_group)
	_get_positions()
	_get_next_position()

func _physics_process(_delta):
	if global_position.distance_to(current_position.position) < 10:
		_get_next_position()

func _get_positions():
	temp_positions = positions.duplicate()
	temp_positions.shuffle()

func _get_next_position():
	if temp_positions == null:
		return
		_get_positions()
		current_position = temp_positions.pop_front()
		direction = to_local(current_position.position).normalized()
