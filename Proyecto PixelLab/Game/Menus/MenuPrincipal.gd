extends Control


func _on_ButtonStart_pressed():
	MusicGobal.replay()
	get_tree().change_scene("res://Game/Levels/Level.1.tscn")
