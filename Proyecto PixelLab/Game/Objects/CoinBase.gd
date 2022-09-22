extends Area2D

export (String, "gold", "silver", "bronze") var type_coin 

onready var animation = $AnimatedSprite
onready var animation_coinbase = $AnimationPlayer
onready var collision_player = $CollisionPlayer



func _ready():
	animation.play()


func _on_body_entered(_body):
	DataPlayer.add_coin(type_coin)
	collision_player.set_deferred("disabled", true)
	animation_coinbase.play("catch_coin")
