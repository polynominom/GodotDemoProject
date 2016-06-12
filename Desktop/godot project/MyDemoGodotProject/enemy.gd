
extends KinematicBody2D
# ENEMY DIFFICULTY
var difficulty = 1

# ENEMY SPECIALTIES
var GOLD = 10
var SPEED = 250
var DAMAGE = 10
var FIRE_RATE = 0.05

var player_pos = Vector2()
var look_point = Vector2()

func _ready():
	set_attributes_by_dif()
	set_fixed_process(true)
	
func set_attributes_by_dif():
	GOLD *= difficulty
	SPEED *= difficulty
	DAMAGE *= difficulty
	FIRE_RATE *= difficulty
	
func _fixed_process(delta):
	player_pos = get_parent().get_node("map").get_node("player").get_global_pos()
	#player_pos = get_parent().get_node("player").get_pos()
	var dir = (player_pos - get_global_pos()).normalized()
	look_at(player_pos)
	move(dir*delta*SPEED)

	
	if(is_colliding()):
		var col = get_collider()
		var name = col.get_name()
		
		var is_player = (name.find("player") != -1)
		var is_bullet = (name.find("bullet") != -1)
		
		if(is_bullet):
			var player = get_parent().get_node("map").get_node("player")
			player.change_gold(GOLD)
			get_collider().is_colliding_done = true
			queue_free()
		if(is_player):
			var player = get_parent().get_node("map").get_node("player")
			player.current_life -= DAMAGE
			player.change_gold(GOLD)
			queue_free()