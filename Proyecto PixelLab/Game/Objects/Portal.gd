extends Area2D

var is_active = false


func _on_body_entered(body):
	body.play_enter_portal(global_position)
 
func play_animation():
	is_active = true
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("unlock")
