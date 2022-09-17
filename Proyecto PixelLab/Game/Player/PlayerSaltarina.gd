extends KinematicBody2D

export var speed = Vector2(300.0, 450.0)
export var acel_down = 400
export var str_jump = 3500
export var str_bounce = 300
export var impulse = -4500
#export var acel_down_power_up = 60

var move = Vector2.ZERO
var str_jump_original
var acel_down_original

onready var animation = $AnimatedSprite
onready var sfx_jump = $SfxJump
onready var camera = $Camera2D
onready var reset_power_up_jump = $ResetPowerUpJump
onready var reset_power_up_fly = $ResetPowerUpFly
onready var animation_power_up = $AnimationPlayer

func _ready():
	str_jump_original = str_jump
	acel_down_original = acel_down

func _physics_process(delta):
	move.x = speed.x * select_direction()
	jump()
	down()
	move_and_slide(move, Vector2.UP)
	crash_roof()
	fall_down()

func select_direction():
	var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	if direction == 0:
		animation.play("idle")
	else:
		if direction < 0:
			animation.flip_h = true
		else:
			animation.flip_h = false
		animation.play("run")
	
	return direction

func down():
	if not is_on_floor():
		animation.play("jump")
		move.y += acel_down
		move.y = clamp(move.y, impulse, speed.y)
		
func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		sfx_jump.play()
		animation.play("jump")
		move_jump()

func move_jump():
	move.y = 0
	move.y -= str_jump

func crash_roof():
	if is_on_ceiling():
		move.y = str_bounce

func fly():
	reset_power_up_fly.start()
	acel_down = 150
	animation_power_up.play("fly")
	move_jump()


func fall_down():
	if position.y > camera.limit_bottom:
		respawn()

func impulse():
	move.y = impulse

func respawn():
	get_tree().reload_current_scene()

func change_str_jump():
	reset_power_up_jump.start()
	str_jump = -impulse * 0.9

func _on_level1_ready():
	pass # Replace with function body.


func _on_ResetPowerUpJump_timeout():
	str_jump = str_jump_original


func _on_ResetPowerUpFly_timeout():
	animation_power_up.play("default")
	acel_down = acel_down_original
	
	
