extends Node

var numbers_carrot_key = 0
var container_carrots

func _ready():
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
		portal.play_animation() 

