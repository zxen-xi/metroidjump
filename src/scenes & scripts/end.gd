extends Node2D


func _on_Button_pressed():
	get_tree().change_scene("res://scenes & scripts/game-start/gamestart.tscn")
	PlayerVariables.health = 75 #this sets health to original so we can play again 
