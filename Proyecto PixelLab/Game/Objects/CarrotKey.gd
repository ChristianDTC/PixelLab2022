extends Area2D

signal catch()


func _on_body_entered(body):
	DataPlayer.rest_carrot_key()
	emit_signal("catch")
	$DetectPlayer.set_deferred("disabled", true)
	$AnimationPlayer.play("catch")
	
