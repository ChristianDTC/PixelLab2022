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


