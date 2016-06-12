
extends KinematicBody2D

# PLAYER STATUS
var START_LIFE = 100
var MOVE_SPEED = 100
var DAMAGE = 10
var FIRE_RATE = 1
var GOLD = 0

var current_life = 0

var canFire = true
var fireTime = 0

var look_direction = Vector2(0,1)

func fire(event):
	var pos = get_canvas_transform().affine_inverse()*event.pos
	var dir = (pos - get_global_pos()).normalized()
	var bullet = preload("res://bullet_scene.scn").instance()
	bullet.advance_dir = dir
	bullet.set_pos(get_global_pos() + dir *  40)
	bullet.get_child(0).set_modulate(Color(0.1,0.5,0.1))
	bullet.set_name("bullet")
	
	get_parent().get_parent().add_child(bullet)
	canFire = false
	fireTime = 0

func _ready():
	# get the player's status from  game knowledge
	var game_stats = get_node("/root/game_knowledge")
	START_LIFE = game_stats.PLAYER_START_LIFE
	DAMAGE = game_stats.PLAYER_DAMAGE
	FIRE_RATE = game_stats.PLAYER_FIRE_RATE
	GOLD = game_stats.PLAYER_GOLD
	MOVE_SPEED = game_stats.PLAYER_MOVEMENT_SPEED
	
	current_life = START_LIFE
	set_fixed_process(true)
	set_process_input(true)
	pass

func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON and event.button_index == 1 and event.pressed):
		if(canFire):
			fire(event)
		elif(fireTime > FIRE_RATE):
			canFire = true
			fire(event)

func _fixed_process(delta):
	fireTime += delta
		
	var pos = get_viewport().get_mouse_pos()
	var mpos = get_canvas_transform().affine_inverse() * pos
	get_node("image").look_at(mpos)
		
	var walk_left = Input.is_action_pressed("move_left")
	var walk_right = Input.is_action_pressed("move_right")
	var walk_up =  Input.is_action_pressed("move_up")
	var walk_down =  Input.is_action_pressed("move_down")
	var motion = Vector2()
		
	if(walk_left):
		motion = Vector2(-1,0) * delta * MOVE_SPEED
		move(motion)
	if(walk_right):
		motion = Vector2(1,0) * delta * MOVE_SPEED
		move(motion)
	if(walk_down):
		motion = Vector2(0,1) * delta * MOVE_SPEED
		move(motion)
	if(walk_up):
		motion = Vector2(0,-1) * delta * MOVE_SPEED
		move(motion)
	
	# If something hits
	if(is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		move(motion)


func change_gold(var gold):
	get_node("/root/game_knowledge").PLAYER_GOLD += gold
	GOLD += gold
	