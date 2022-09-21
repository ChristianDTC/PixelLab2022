extends Node

signal actualice_data()
signal game_over()

var life = 3
var coin_gold = 0
var coin_silver = 0
var coin_bronze = 0

func rest_life():
	life -= 1
	if life == 0:
		emit_signal("game_over")
	emit_signal("actualice_data")

func add_coin(coin):
	match coin:
		"gold":
			coin_gold += 1
		"silver":
			coin_silver += 1
		"bronze":
			coin_bronze += 1
		_:
			print("ERROR")
	emit_signal("actualice_data")
