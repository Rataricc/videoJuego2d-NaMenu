extends Area2D
# restringir al usaurio, lo que pueda ingresar en esa variable...
export(String, "oro", "plata", "bronce") var tipo_moneda

onready var animacion := $AnimatedSprite
onready var animacion_consumir_moneda := $AnimationPlayer
onready var colision_personaje := $CollisionShape2D
#onready var contador := 0

func _ready(): 
	animacion.play()


func _on_body_entered(body):
	DatosPlayers.sumar_monedas(tipo_moneda)
	colision_personaje.set_deferred("disabled", true)
	#contador += 1
	#print(contador)
	animacion_consumir_moneda.play("Consumir")
