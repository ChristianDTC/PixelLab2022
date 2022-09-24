extends Control


func _on_ButtonMenuPrincipal_pressed():
	MusicGobal.replay()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game/Menus/MenuPrincipal.tscn")
