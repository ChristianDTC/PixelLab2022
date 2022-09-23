extends Control

func _ready():
	DataPlayer.reset()

func _on_ButtonStart_pressed():
	MusicGobal.replay()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game/Levels/Level.1.tscn")
