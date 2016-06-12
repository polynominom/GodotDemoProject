
extends Control

var LIFE_PRICE = 50
var life_amount = 5

var DAMAGE_PRICE = 100
var damage_amount = 5

var SPEED_PRICE = 200
var speed_amount = 1.15

var FIRE_RATE_PRICE = 100
var fire_rate_amount = -0.1

func print_fire_rate():
	get_node("fire_rate_area").set_text(var2str(get_node("/root/game_knowledge").PLAYER_FIRE_RATE))

func print_gold():
	get_node("gold_area").set_text(var2str(get_node("/root/game_knowledge").PLAYER_GOLD))

func print_damage():
	get_node("damage_area").set_text(var2str(get_node("/root/game_knowledge").PLAYER_DAMAGE))

func print_move_speed():
	get_node("speed_area").set_text(var2str(get_node("/root/game_knowledge").PLAYER_MOVEMENT_SPEED))

func print_life():
	get_node("life_area").set_text(var2str(get_node("/root/game_knowledge").PLAYER_START_LIFE))

func _ready():
	print_damage()
	print_fire_rate()
	print_gold()
	print_life()
	print_move_speed()

	
func _on_life_buy_button_pressed():
	if(get_node("/root/game_knowledge").PLAYER_GOLD >= LIFE_PRICE):
		# SEND MESSAGE
		get_node("upgrade_info").set_text("Life successfully upgraded")
		
		# UPDATE PLAYER'S GOLD AND STATUS
		get_node("/root/game_knowledge").PLAYER_GOLD -= LIFE_PRICE
		get_node("/root/game_knowledge").PLAYER_START_LIFE += life_amount
		
		# UPDATE THE 2D VİıISUAL AREA
		print_gold()
		print_life()
	else:
		# send message
		get_node("upgrade_info").set_text("Can not upgrade starting life, insufficient gold!")


func _on_fire_rate_buy_button_pressed():
	if(get_node("/root/game_knowledge").PLAYER_GOLD >= FIRE_RATE_PRICE):
		# SEND MESSAGE
		get_node("upgrade_info").set_text("Fire rate successfully upgraded")
		
		# UPDATE PLAYER'S GOLD AND STATUS
		get_node("/root/game_knowledge").PLAYER_GOLD -= FIRE_RATE_PRICE
		get_node("/root/game_knowledge").PLAYER_FIRE_RATE += fire_rate_amount
		
		# UPDATE THE 2D VİıISUAL AREA
		print_gold()
		print_fire_rate()
	else:
		get_node("upgrade_info").set_text("Can not upgrade fire rate, insufficient gold!")


func _on_move_speed_buy_button_pressed():
	if(get_node("/root/game_knowledge").PLAYER_GOLD >= SPEED_PRICE):
		# SEND MESSAGE
		get_node("upgrade_info").set_text("Move speed successfully upgraded")
		
		# UPDATE PLAYER'S GOLD AND STATUS
		# TODO must be functionate
		get_node("/root/game_knowledge").PLAYER_GOLD -= SPEED_PRICE
		get_node("/root/game_knowledge").PLAYER_MOVEMENT_SPEED *= speed_amount
		
		# UPDATE THE 2D VİıISUAL AREA
		print_gold()
		print_move_speed()
	else:
		get_node("upgrade_info").set_text("Can not upgrade move speed, insufficient gold!")


func _on_damage_buy_button_pressed():
	if(get_node("/root/game_knowledge").PLAYER_GOLD >= DAMAGE_PRICE):
		# SEND MESSAGE
		get_node("upgrade_info").set_text("Damage successfully upgraded")
		
		# UPDATE PLAYER'S GOLD AND STATUS
		get_node("/root/game_knowledge").PLAYER_GOLD -= DAMAGE_PRICE
		get_node("/root/game_knowledge").PLAYER_DAMAGE += damage_amount
		
		# UPDATE THE 2D VİıISUAL AREA
		print_gold()
		print_damage()
	else:
		get_node("upgrade_info").set_text("Can not upgrade damage, insufficient gold!")


func _on_menu_button_pressed():
	get_tree().change_scene("main_scene.scn")
