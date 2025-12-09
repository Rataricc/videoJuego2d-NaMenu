extends KinematicBody2D


#func _ready():
#	print("Hola mundo soy na menu desde el script KinematicBody2d")

#func _process(delta):
#	if Input.is_action_pressed("salto"): 
#		print("Saltando")
#	elif Input.is_action_just_pressed("mov_derecha"): 
#		print("Derecha")
#	elif Input.is_action_just_released("mov_izquierda"):
#		print("izquierda")
export var velocidad = Vector2(150.0, 150.0)
export var acel_caida = 400
export var fuerza_salto = 3000
export var fuerza_rebote = 350
export var impulso = -4000#antes era -3800
export var acel_caida_power_up = 60

var movimiento = Vector2.ZERO
var fuerza_salto_orginal 
var aceleracion_caida_original
var puede_moverse = true

# Sigue en el nuevo script creado de autoload.
# se le indica al script que es un autoload ingresando en la pestaña: 
# proyecto --- configuracion del proyecto --- AutoCarga y se carga el script...
# despues se tendria que continuar aca...
#var vidas = 3 

onready var animacion = $AnimatedSprite
onready var audio_salto = $AudioSalto
onready var camara = $Camera2D
onready var deactivateSaltoFuerza := $deactivatePowerUpSalto
onready var deactivateVolar := $deactivatePowerUpVolar
onready var personaje_animacion := $AnimationPlayer


func _ready():
	personaje_animacion.play("aclarar")
	fuerza_salto_orginal = fuerza_salto
	aceleracion_caida_original = acel_caida


func _physics_process(delta):
	movimiento.x = velocidad.x * tomar_direccion()
	caer()
	saltar()
	colision_techo()
	caida_al_vacio()
	#respawm()
	#print(movimiento)
	move_and_slide(movimiento, Vector2.UP)

func tomar_direccion():
#	var direccion = Vector2(Input.get_action_strength("mov_derecha") - Input.get_action_strength("mov_izquierda"), 1.0)
	var direccion = 0
	if puede_moverse: 
		#var direccion = Input.get_action_strength("mov_derecha") - Input.get_action_strength("mov_izquierda")
		direccion = Input.get_action_strength("mov_derecha") - Input.get_action_strength("mov_izquierda")
		if direccion == 0: 
			animacion.play("idle")
		else: 
			if direccion < 0:
				animacion.flip_h = true
			else: 
				animacion.flip_h = false
			animacion.play("correr")
		#print(direccion)
	return direccion

func caer(): 
	if not is_on_floor(): 
		animacion.play("saltar")
		movimiento.y += acel_caida
		#movimiento.y = clamp(movimiento.y, -fuerza_salto, velocidad.y)
		movimiento.y = clamp(movimiento.y, impulso, velocidad.y)
	
func saltar(): 
	if Input.is_action_just_pressed("salto") and is_on_floor() and puede_moverse: 
		audio_salto.play()
		animacion.play("saltar")
		movimiento_saltar()
#		movimiento.y = 0
#		movimiento.y -= fuerza_salto


func movimiento_saltar(): 
	movimiento.y = 0
	movimiento.y -= fuerza_salto

func colision_techo():
	if is_on_ceiling():
		movimiento.y = fuerza_rebote


func impulsar(): 
	movimiento.y = impulso


func cambiar_fuerza_salto():
	deactivateSaltoFuerza.start()
	fuerza_salto = -impulso * 0.9


func volar(): 
	deactivateVolar.start()
	acel_caida = acel_caida_power_up
	personaje_animacion.play("volar")
	movimiento_saltar()


func caida_al_vacio(): 
	if position.y > camara.limit_bottom:
		respawm()


## Se tendria o podria utilizar para acceder al atributo getters y setters. 
## utilizando encapsulamiento... seria la practica ideal para el caso de: 
## DatosPlayers.vidas...
func respawm():
	DatosPlayers.restar_vidas_player()
#	vidas -= 1
#	print(vidas)
	#if position.y > camara.limit_bottom:
	personaje_animacion.play("oscurecer")
	if DatosPlayers.vidas != 0: 
		get_tree().reload_current_scene()
	# o
#	if DatosPlayers.vidas >= 1: 
#		get_tree().reload_current_scene()


func _on_deactivatePowerUp_timeout():
	fuerza_salto = fuerza_salto_orginal


func _on_deactivatePowerUpVolar_timeout():
	personaje_animacion.play("default")
	acel_caida = aceleracion_caida_original


func play_entrar_portal(portal_posicion):
	puede_moverse = false
	#$AnimationPlayer.play("entrar_portal")
	personaje_animacion.play("entrar_portal")
	$Tween.interpolate_property(
		self,
		"global_position", 
		global_position, 
		portal_posicion, 
		0.8,
		Tween.TRANS_LINEAR,
		Tween.EASE_OUT_IN
	)
	$Tween.start()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "entrar_portal": 
		personaje_animacion.play("oscurecer")
