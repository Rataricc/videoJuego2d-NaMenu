extends Area2D

var portal_activate = false
export var nivel_proximo = ""


#func _input(event):
#	if event.is_action_pressed("pausa"):
#		$AnimationPlayer.play("activado")

#func _ready():
#	#print(get_parent().name)
#	get_parent().connect("abrir_portal", self, "play_animacion")


func _on_body_entered(body):
	if portal_activate:
		body.play_entrar_portal(global_position)
		print("al siguiente nivel")
		yield(get_tree().create_timer(1.0), "timeout")
		cambiar_nivel()


#"res://juego/Niveles/NivelTemporal.tscn"
func cambiar_nivel(): 
	get_tree().change_scene(nivel_proximo)

# AnimatedSprite(), tambien podria ir aca.
func play_animacion(): 
	portal_activate = true
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("activado")
