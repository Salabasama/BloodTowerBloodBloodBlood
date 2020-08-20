extends Control

func _ready():
	pass


func _on_Play_pressed():
	get_tree().change_scene("res://Scene/Level_Menu.tscn")
