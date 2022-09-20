extends Area2D

var is_active = false


func _on_body_entered(body):
	pass # Replace with function body.
 
func play_animation():
	is_active = true
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("unlock")
