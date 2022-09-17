extends StaticBody2D


func _on_DetectPlayer_body_entered(body):
	$DetectPlayer/CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("fall")

func diseable():
	$Collision.set_deferred("disabled", true)
