extends Control


func _ready():
	$PanelPuntaje/Puntaje.text = "Puntaje: {p}".format({"p": DatosPlayers.generar_puntaje()})


func _on_menuPrincipal_pressed():
	get_tree().change_scene("res://juego/menus/MenuPrincipal.tscn")
