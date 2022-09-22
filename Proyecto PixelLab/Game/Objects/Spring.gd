extends StaticBody2D

onready var animation = $AnimationPlayer
onready var sxf_jump = $SxfJump



func _ready():
	animation.play("Idle")


func _on_DetectImpulse_body_entered(body):
	sxf_jump.play()
	animation.play("In")
	body.impulse()

