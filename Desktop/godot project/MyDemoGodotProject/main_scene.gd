
extends Control

# member variables here, example:
# var a=2
# var b="textvar"
var selected_dif
func _ready():
	for i in range(10):
		get_node("select_difficulty/OptionButton").add_item(var2str(i+1))


func _on_select_level_pressed():
	var option_btn = get_node("select_difficulty/OptionButton")
	if(option_btn.is_visible()):
		option_btn.set_hidden(true)
	else:
		option_btn.set_hidden(false)

func _on_upgrade_button_pressed():
	get_tree().change_scene("res://upgrade_scene.scn")

func _on_exit_pressed():
	pass # replace with function body

func _on_play_pressed():
	get_tree().change_scene("res://arrow_battle.scn")

func _on_reset_buton_pressed():
	get_node("/root/game_knowledge").reset()

func _on_OptionButton_item_selected( ID ):
	get_node("/root/game_knowledge").difficulty = ID + 1

func show_message():
	pass