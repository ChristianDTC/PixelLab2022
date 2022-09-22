extends Area2D

var is_active = false
export var next_level = ""


func _on_body_entered(body):
	if is_active:
		body.play_enter_portal(global_position)
		yield(get_tree().create_timer(1.1), "timeout")
		change_level()


func change_level():
# warning-ignore:return_value_discarded
	get_tree().change_scene(next_level)
 

func play_animation():
	is_active = true
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("unlock")
