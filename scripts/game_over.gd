extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_reestart_pressed() -> void:
	get_tree().reload_current_scene()

func _on_button_menu_2_pressed() -> void:
	get_tree().change_scene_to_file("res://prefabs/menu.tscn")