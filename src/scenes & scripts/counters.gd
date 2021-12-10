extends Area2D



func _on_counter_1_body_entered(body):
	PlayerVariables.score += 1
	get_parent().remove_child(self)
