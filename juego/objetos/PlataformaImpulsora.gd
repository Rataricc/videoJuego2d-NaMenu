extends Area2D
#extends StaticBody2D

# Se puede cambiar el nodo padre o principal para tratar de resolver.
# el "bug" de ir caminando chocar contra la plataforma simplemente y que este salte...
# se puede dejar asi tambien... cireterio de diseño... 

# Se cambia el nodo padre de Area2D a un staticBody2D para manejar cuerpos staticos. 
# en vez de un area2D.

onready var animacion := $AnimationPlayer
onready var sonidoPlataformaSalto := $PlataformaSalto

func _ready():
	animacion.play("idle")


func _on_DetectorImpulso_body_entered(body):
	sonidoPlataformaSalto.play()
	animacion.play("impulsar")
	body.impulsar()
