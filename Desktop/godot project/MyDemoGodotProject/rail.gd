
extends Node2D
var SPEED = 0
var offset = 0


func stop():
	set_fixed_process(false)


func _fixed_process(delta):
	offset += delta*SPEED
	set_pos(Vector2(offset, 0))


func _ready():
	SPEED = get_node("player").MOVE_SPEED
	set_fixed_process(true)


