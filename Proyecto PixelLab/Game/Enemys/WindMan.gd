extends Area2D

onready var detect_player = $DetectPlayer
onready var detect_trample = $DetectTrample/Collision

func _on_DetectTrample_body_entered(body):
	disable_colliders([detect_player, detect_trample])
	body.impulse()

func _on_body_entered(body):
	body.respawn()

func disable_colliders(colliders):
	for collision in colliders:
		collision.set_deferred("disabled", true)
		collision.set_deferred("visible", false)
