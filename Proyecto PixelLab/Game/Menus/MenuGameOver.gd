extends Control

var level_actual = ""

func _on_ButtonMenuPrincipal_pressed():
	get_tree().change_scene("res://Game/Menus/MenuPrincipal.tscn")


func _on_ButtonRestart_pressed():
	get_tree().change_scene(level_actual)
