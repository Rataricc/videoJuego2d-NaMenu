extends Area2D

export var velocidad = 400.0

onready var animacion = $Animacion
var mi_pos = Vector2.ZERO

func crear(pos):
	mi_pos = pos

func _ready():
	#global_position = mi_pos
	global_position.x = mi_pos.x
	global_position.y = mi_pos.y
	animacion.play("moverse")


func _process(delta):
	global_position.y += velocidad * delta
	#position.y += velocidad * delta


func _on_VisibilityNotifier2D_screen_exited():
	destruir_nodo()
	
func destruir_nodo():
	queue_free()


#nombre de nodo.
#func _on_body_entered(body):
#	if body.name == "NaMenu": 
#		body.respawm()
#	destruir_nodo()

# Por grupo
func _on_body_entered(body):
	if body.is_in_group("player"): 
		body.respawm()
	destruir_nodo()
