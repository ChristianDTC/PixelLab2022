extends KinematicBody2D

export var velocity = 100.0

var gravity = 100.0
var move = Vector2.ZERO

onready var animation = $AnimatedSprite
onready var detect_empty = $DetectEmpty
onready var detect_object = $DetectObject

func _physics_process(delta):
	fall()
	run()
	move_and_slide(move, Vector2.UP)

func fall():
	if not is_on_floor():
		move.y = gravity

func run():
	if not animation.is_playing():
		animation.play("run")
		
	detect_collision()
		
	move.x = velocity
	
func detect_collision():
	if not detect_empty.is_colliding() or detect_object.is_colliding():
		velocity *= -1
		detect_empty.position *= -1
		detect_object.position *= -1
		detect_object.scale *= -1
		anime(animation.flip_h)
		

func anime(value_present):
	animation.flip_h = !value_present
	

func _on_DetecPlayer_body_entered(body): 
	body.respawn()
