extends Area2D

func _on_DetectTrample_body_entered(body):
	body.impulse()
