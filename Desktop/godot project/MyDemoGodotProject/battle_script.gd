
extends Node2D

var is_game_over = false
var selected_dif = 1

var enemy_spawn_time = 0
var enemy_spawn_stat = "normal"

func set_status_labels():
	var player = get_node("map/player")
	if(player == null):
		return
		
	var player_stat = player.get_node("camera").get_node("stats")
	
	if(player_stat == null):
		return
	player_stat.get_node("gold_amount").set_text(var2str(player.GOLD))
	player_stat.get_node("life_amıoıunt").set_text(var2str(player.current_life))


func _ready():
	selected_dif = get_node("/root/game_knowledge").difficulty
	set_process(true)
	pass
	
func _process(delta):
	enemy_spawn_time += delta
	set_status_labels()
	
	if(get_node("map/player").current_life <= 0):
		get_tree().change_scene("res://game_over.scn")
		
	# spawn enemy regarding to time
	elif(enemy_spawn_time >= 2):

		
		var spawn_area = get_node("map").get_node("spawn_point")
		var enemy = preload("res://enemy.scn").instance()
		enemy.difficulty = selected_dif
		enemy.set_pos(spawn_area.get_global_pos())
		enemy.get_child(0).set_modulate(Color(1.0, rand_range(0,1),rand_range(0,1)))
		enemy.set_name("enemy")
		add_child(enemy)
		enemy_spawn_time = 0
		
func game_over():
	var player = get_node("map/player")
	var menu_button = get_node("menu_button")
	var game_over = get_node("game_over")
	
	menu_button.set_pos(player.get_pos())
	game_over.set_pos(Vector2(player.get_pos().x, player.get_pos().y + 20))
	
	
	player.queue_free()
	get_node("map").queue_free()
	
	