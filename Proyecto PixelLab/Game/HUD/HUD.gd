extends Control

onready var label_life = $ConteinerLife/Amount
onready var label_coin_gold = $ConteinerCoinsGold/Amount
onready var label_coin_silver = $ConteinerCoinsSilver/Amount
onready var label_coin_bronze = $ConteinerCoinsBronze/Amount

func _ready():
	DataPlayer.connect("actualice_data", self, "actualice_HUD")
	actualice_HUD()

func actualice_HUD():
	label_life.text = "%s" % DataPlayer.life
	label_coin_gold.text = "%s" % DataPlayer.coin_gold
	label_coin_silver.text = "%s" % DataPlayer.coin_silver
	label_coin_bronze.text = "%s" % DataPlayer.coin_bronze
