extends Area2D

export var es_pincho_trampa = false
onready var detector_personaje = $DetectorPersonaje

func _ready(): 
	if es_pincho_trampa: 
		detector_personaje.enabled = true
		rotation_degrees = 180


func _process(delta):
	if detector_personaje.is_colliding(): 
		#detector_personaje.enabled = false
		detector_personaje.set_deferred("enabled", false)
		$AnimationPlayer.play("caer")

func _on_body_entered(body):
	body.respawm()


#func _on_body_exited(body):
#	print("salio ", body.name)
