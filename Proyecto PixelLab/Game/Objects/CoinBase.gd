extends Area2D

onready var animation = $AnimatedSprite
onready var animation_coinbase = $AnimationPlayer
onready var collision_player = $CollisionPlayer


func _ready():
	animation.play()


func _on_body_entered(body):
	collision_player.set_deferred("disabled", true)
	animation_coinbase.play("catch_coin")
