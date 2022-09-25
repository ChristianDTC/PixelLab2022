extends KinematicBody2D

export var speed = Vector2(300.0, 450.0)
export var acel_down = 900
export var str_jump = 3500
export var str_bounce = 300
export var impulsed = -5000

var move = Vector2.ZERO
var str_jump_original
var acel_down_original
var can_move = true

onready var animation = $AnimatedSprite
onready var sfx_jump = $SfxJump
onready var camera = $Camera2D
onready var reset_power_up_jump = $ResetPowerUpJump
onready var reset_power_up_fly = $ResetPowerUpFly
onready var animation_player = $AnimationPlayer



func _ready():
	animation_player.play("clarify")
	str_jump_original = str_jump
	acel_down_original = acel_down


func _physics_process(_delta):
	move.x = speed.x * select_direction()
	jump()
	down()
# warning-ignore:return_value_discarded
	move_and_slide(move, Vector2.UP)
	crash_roof()
	fall_down()


func select_direction():
	var direction = 0
	if can_move:
		direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
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
		move.y = clamp(move.y, impulsed, speed.y)


func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor() and can_move:
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
	animation_player.play("fly")
	move_jump()


func fall_down():
	if position.y > camera.limit_bottom:
		respawn()


func impulse():
	move.y = impulsed


func respawn():
	DataPlayer.rest_life()
	animation_player.play("obscure")
	if DataPlayer.life >= 1:
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()


func change_str_jump():
	reset_power_up_jump.start()
	str_jump = -impulsed * 2


func _on_ResetPowerUpJump_timeout():
	str_jump = str_jump_original


func _on_ResetPowerUpFly_timeout():
	animation_player.play("default")
	acel_down = acel_down_original


func play_enter_portal(position_portal):
	can_move = false
	animation_player.play("enter_portal")
	$Tween.interpolate_property(
		self,
		"global_position",
		global_position,
		position_portal,
		0.8,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
	)
	$Tween.start()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "enter_portal":
		animation_player.play("obscure")

