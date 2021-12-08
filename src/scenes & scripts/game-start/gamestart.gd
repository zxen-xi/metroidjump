extends Node2D



func _on_start_pressed():
	get_tree().change_scene("res://scenes & scripts/intro/intro.tscn")




func _on_exit_pressed():
	get_tree().quit()
