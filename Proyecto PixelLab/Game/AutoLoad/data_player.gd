extends Node

signal actualice_data()
signal game_over()

var life = 3
var carrot_key = 0
var coin_gold = 0
var coin_silver = 0
var coin_bronze = 0
var level_actual = ""
var total_score = 0

func reset():
	life = 3
	coin_gold = 0
	coin_silver = 0
	coin_bronze = 0
	total_score = 0

func score():
	var value_coin_gold = coin_gold * 10
	var value_coin_silver = coin_silver * 6
	var value_coin_bronze = coin_bronze * 3
	total_score = value_coin_gold + value_coin_silver + value_coin_bronze
	return total_score

func rest_life():
	life -= 1
	if life == 0:
		emit_signal("game_over")
	emit_signal("actualice_data")

func rest_carrot_key():
	carrot_key -= 1
	emit_signal("actualice_data")

func acount_carrot_key(value):
	carrot_key = value
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
