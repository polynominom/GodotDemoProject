
extends Control

func _ready():
	get_node("/root/game_knowledge").game_over()
	
func _on_Button_pressed():
	get_tree().change_scene("res://main_scene.scn")
