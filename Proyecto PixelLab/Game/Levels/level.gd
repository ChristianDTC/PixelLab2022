extends Node

export var menu_game_over = "res://Game/Menus/MenuGameOver.tscn"

var numbers_carrot_key = 0
var container_carrots

func _ready():
	DataPlayer.connect("game_over", self, "game_over")
	container_carrots = get_node_or_null("Carrots")
	if container_carrots != null:
		total_carrot_key_nivel()

func total_carrot_key_nivel():
	numbers_carrot_key = container_carrots.get_child_count()
	for carrot_key in container_carrots.get_children():
		carrot_key.connect("catch", self, "carrot_key_rest")


func carrot_key_rest():
	numbers_carrot_key -= 1
	if numbers_carrot_key == 0:
		var portal = get_node_or_null("Portal")

func game_over():
	get_tree().change_scene(menu_game_over)
