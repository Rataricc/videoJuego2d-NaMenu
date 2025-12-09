extends Node2D

onready var detector_jugador = $Sprite/RayCast2D
onready var posiciones_disparo = $Sprite/PosicionesDisparo
#onready var rayo = "res://juego/objetos/Rayo.tscn"
export var rayo: PackedScene
onready var tiempo_al_disparo = $Timer
onready var sonido_sfx_rayos = $Rayos

var puede_disparar = true

#func _ready(): 
#	print(owner.name)

func _process(delta):
	if detector_jugador.is_colliding() and puede_disparar:
		disparar()
		puede_disparar = false
		tiempo_al_disparo.start()

# Cuando el timer llego a cero (0) puede disparar va a volver a hacer true.

#func disparar():
#	for posicion in posiciones_disparo.get_children():
#		var nuevo_rayo = rayo.instance()
#		nuevo_rayo.crear(posicion.global_position)
#		add_child(nuevo_rayo)

func disparar():
	sonido_sfx_rayos.play()
	for posicion in posiciones_disparo.get_children():
		var nuevo_rayo = rayo.instance()
		nuevo_rayo.crear(posicion.global_position)
		owner.get_node("Rayos").add_child(nuevo_rayo)


func _on_Timer_timeout():
	puede_disparar = true
