extends Area2D

export var velocity = 400.0

onready var animation = $Animation

var my_position = Vector2.ZERO

func create(pos):
	my_position = pos

func _ready():
	global_position = my_position
	animation.play("move")

func _process(delta):
	global_position.y += velocity * delta


func _on_VisibilityNotifier2D_screen_exited():
	destroy()

func destroy():
	queue_free()

func _on_Bolt_body_entered(body):
	if body.is_in_group("player"):
		body.respawn()
		
	destroy()
