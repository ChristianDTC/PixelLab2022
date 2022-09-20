extends Area2D




func _on_body_entered(body):
	$DetectPlayer.set_deferred("disabled", true)
	$AnimationPlayer.play("catch")
	
