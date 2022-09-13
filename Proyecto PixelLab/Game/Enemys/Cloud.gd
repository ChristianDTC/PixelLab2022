extends Node2D

onready var detect_player = $Sprite/RayCast2D
onready var positions_shots = $Sprite/PositionsShots
onready var reset_timer = $Timer

export  var bolt: PackedScene

var can_shot = true
 
func _process(delta):
	if detect_player.is_colliding() and can_shot:
		shoot()
		can_shot = false
		reset_timer.start()

func shoot():
	for position in positions_shots.get_children():
		var new_bolt = bolt.instance()
		new_bolt.create(position.global_position)
		owner.get_node("Bolts").add_child(new_bolt)


func _on_Timer_timeout():
	can_shot = true
