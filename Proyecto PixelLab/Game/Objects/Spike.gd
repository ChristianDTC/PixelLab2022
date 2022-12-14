extends Area2D

export var is_cheat = false

var color_cheat = Color.orangered

onready var detect_player = $DetectPlayer



func _ready():
	if is_cheat:
		$Sprite.modulate = color_cheat
		detect_player.enabled = true
		rotation_degrees = 180


func _process(_delta):
	if detect_player.is_colliding():
		detect_player.set_deferred("enabled", false)
		$AnimationPlayer.play("fall")


func _on_body_entered(body):
	body.respawn()

