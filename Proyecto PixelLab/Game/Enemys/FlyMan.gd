extends Area2D

onready var detect_player = $DetectPlayer
onready var animation_player = $AnimationPlayer


func _on_body_entered(body):
	body.respawn()
