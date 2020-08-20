extends Control



func _on_Back_pressed():
	get_tree().change_scene("res://Scene/Menu.tscn")


func _on_Level1_pressed():
	get_tree().change_scene("res://Scene/World.tscn")
