extends Area2D

onready var animation = $AnimationPlayer
onready var detect_player = $CollisionShape2D



func _on_body_entered(body):
	apply_power_up(body)
	detect_player.set_deferred("disabled", true)
	animation.play("catch")


func apply_power_up(_body):
	pass
