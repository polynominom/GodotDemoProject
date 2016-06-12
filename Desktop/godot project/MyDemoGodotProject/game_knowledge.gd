
extends Node
# GAME DIFFICULTY
var difficulty = 1

# PLAYER FIRST STATS
var _PLAYER_MOVEMENT_SPEED = 200
var _PLAYER_DAMAGE = 10
var _PLAYER_FIRE_RATE = 1
var _PLAYER_START_LIFE = 100
var _PLAYER_GOLD = 0

# PLAYER STATS
var PLAYER_MOVEMENT_SPEED = 200
var PLAYER_DAMAGE = 10
var PLAYER_FIRE_RATE = 1
var PLAYER_START_LIFE = 20
var PLAYER_GOLD = 1000

# -----------------------------ENEMY STATS-----------------------------

#------------NORMAL ENEMY------------
var ENEMY_NORMAL_DAMAGE = 10
var ENEMY_NORMAL_FIRE_RATE = 2
var ENEMY_NORMAL_MOVE_SPEED = 150
var ENEMY_NORMAL_LIFE = 60
#------------NORMAL ENEMY------------

#------------BRUTE ENEMY------------
var ENEMY_BRUTE_DAMAGE = 50
var ENEMY_BRUTE_FIRE_RATE = 0
var ENEMY_BRUTE_MOVE_SPEED = 100
var ENEMY_BRUTE_LIFE = 500
#------------BRUTE ENEMY------------

#------------FAST ENEMY------------
var ENEMY_FAST_DAMAGE = 5
var ENEMY_FAST_FIRE_RATE = 1.5
var ENEMY_FAST_MOVE_SPEED = 300
var ENEMY_FAST_LIFE = 50
#------------FAST ENEMY------------

#------------SPECIAL ENEMY------------
var ENEMY_SPECIAL_DAMAGE = 10
var ENEMY_SPECIAL_FIRE_RATE = 2
var ENEMY_SPECIAL_MOVE_SPEED = 150
var ENEMY_SPECIAL_LIFE = 150
#------------SPECIAL ENEMY------------

# -----------------------------ENEMY STATS-----------------------------
func reset():
	PLAYER_DAMAGE = _PLAYER_DAMAGE
	PLAYER_FIRE_RATE = _PLAYER_FIRE_RATE
	PLAYER_GOLD = _PLAYER_GOLD
	PLAYER_MOVEMENT_SPEED = _PLAYER_MOVEMENT_SPEED
	PLAYER_START_LIFE = _PLAYER_START_LIFE
	save()
	
func _ready():
	var f = File.new()
	# Load high score
	if (f.open("user://player_speed", File.READ) == OK):
		PLAYER_MOVEMENT_SPEED = f.get_var()
	
	if (f.open("user://player_damage", File.READ) == OK):
		PLAYER_DAMAGE = f.get_var()
		
	if (f.open("user://player_fire_rate", File.READ) == OK):
		PLAYER_FIRE_RATE = f.get_var()
		
	if (f.open("user://player_start_life", File.READ) == OK):
		PLAYER_START_LIFE = f.get_var()
	
	if (f.open("user://player_gold", File.READ) == OK):
		PLAYER_GOLD = f.get_var()
		
func game_over():
	save()

func save():
	var f = File.new()
	f.open("user://player_speed", File.WRITE)
	f.store_var(PLAYER_MOVEMENT_SPEED)
	
	f.open("user://player_damage", File.WRITE)
	f.store_var(PLAYER_DAMAGE)
	
	f.open("user://player_fire_rate", File.WRITE)
	f.store_var(PLAYER_FIRE_RATE)
	
	f.open("user://player_start_life", File.WRITE)
	f.store_var(PLAYER_START_LIFE)
	
	f.open("user://player_gold", File.WRITE)
	f.store_var(PLAYER_GOLD)	
	


