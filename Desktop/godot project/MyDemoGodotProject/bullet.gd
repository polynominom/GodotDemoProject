
extends KinematicBody2D

const SPEED = 500

var is_colliding_done = false
var advance_dir = Vector2()

func _fixed_process(delta):
	move(advance_dir*delta*SPEED)
	if(is_colliding()):
		if(get_collider().get_name() == "map"):
			queue_free()
			
	if(is_colliding_done):
		queue_free()
		
func updatePlayerStats():
	get_parent().get
func _ready():
	set_fixed_process(true)
	pass


