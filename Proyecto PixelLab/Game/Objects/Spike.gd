extends Area2D

export var is_cheat = false

onready var detect_player = $DetectPlayer

func _ready():
	detect_player.enabled = true
	if is_cheat:
		rotation_degrees = 180

func _process(delta):
	if detect_player.is_colliding():
		pass

func _on_body_entered(body):
	body.respawn()

