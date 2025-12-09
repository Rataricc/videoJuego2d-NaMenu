extends Area2D

onready var detector_jugador = $DetectorJugador
onready var detector_pisoton = $DetectorPisoton/Colisionador
onready var animacion = $AnimationPlayer

func _on_DetectorPisoton_body_entered(body):
	#detector_jugador.disabled = true
#	detector_jugador.set_deferred("disabled", true)
#	detector_jugador.set_deferred("visible", false)
	#get_tree().paused = true
	desactivar_colisionadores([detector_jugador, detector_pisoton])
	animacion.stop()
	animacion.play("morir")
	body.impulsar()


func _on_body_entered(body):
	body.respawm()


func desactivar_colisionadores(colisionadores): 
	for colision in colisionadores: 
		colision.set_deferred("disabled", true)
		colision.set_deferred("visible", false)
