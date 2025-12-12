extends Control

#res://juego/Niveles/Nivel1_v2.tscn
#res://juego/Niveles/Nivel1.tscn

func _ready():
	DatosPlayers.reset()

func _on_IniciarJuego_pressed():
	get_tree().change_scene("res://juego/Niveles/Nivel1_v2.tscn")
