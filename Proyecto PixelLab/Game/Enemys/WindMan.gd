extends Area2D

onready var detect_player = $DetectPlayer
onready var detect_trample = $DetectTrample/Collision
onready var animation_player = $AnimationPlayer



func _on_DetectTrample_body_entered(body):
	disable_colliders([detect_player, detect_trample])
	animation_player.stop()
	animation_player.play("Die")
	body.impulse()


func _on_body_entered(body):
	body.respawn()


func disable_colliders(colliders):
	for collision in colliders:
		collision.set_deferred("disabled", true)
		collision.set_deferred("visible", false)
