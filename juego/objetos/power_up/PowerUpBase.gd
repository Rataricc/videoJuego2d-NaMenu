extends Area2D

#func _ready():
#	print("Hola mundo soy: ", self.name)

onready var animacion := $AnimationPlayer
onready var detector_personaje := $CollisionShape2D

func _on_body_entered(body):
	aplicar_power_up(body)
	detector_personaje.set_deferred("disabled", true)
	animacion.play("consumir")

func aplicar_power_up(body): 
	pass
	##print("Hola mundo soy: ", self.name)
