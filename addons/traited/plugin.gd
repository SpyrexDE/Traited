tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("TRAITED_CONFIG", "res://addons/traited/CONFIG.gd")
	add_custom_type("TopDownCharacter", "RigidBody2D", preload("custom_types/TopDownCharacter.gd"), null)#preload("class-icon.svg"))

func _exit_tree():
	remove_custom_type("TopDownCharacter")
