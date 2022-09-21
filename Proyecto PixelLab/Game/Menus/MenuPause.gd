extends Control


func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("pause"):
		visible = not visible
		get_tree().paused = not get_tree().paused

func _on_ButtonContinue_pressed():
	get_tree().paused = false
	visible = not visible


func _on_ButtonMenuPrincipal_pressed():
	get_tree().change_scene("res://Game/Menus/MenuPrincipal.tscn")
	get_tree().paused = false
