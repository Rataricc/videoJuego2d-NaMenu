extends Control

var nivel_actual = ""

func _ready():
	nivel_actual = DatosPlayers.nivel_actual
	DatosPlayers.reset()
	

func _on_menuPrincipal_pressed():
	get_tree().change_scene("res://juego/menus/MenuPrincipal.tscn")


func _on_Reiniciar_pressed():
	get_tree().change_scene(nivel_actual)
