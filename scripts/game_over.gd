extends Control


func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	pass

func _on_button_reestart_pressed() -> void:
	get_tree().reload_current_scene()

func _on_button_menu_2_pressed() -> void:
	get_tree().change_scene_to_file("res://prefabs/menu.tscn")
