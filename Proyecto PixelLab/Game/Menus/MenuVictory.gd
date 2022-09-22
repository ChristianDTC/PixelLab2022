extends Control


func _ready():
	$Score.text = "Puntaje: {p}".format({"p":DataPlayer.score()})
 


func _on_ButtonMenuPrincipal_pressed():
	get_tree().change_scene("res://Game/Menus/MenuPrincipal.tscn")
