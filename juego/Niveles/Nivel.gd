extends Node2D
# Señales personalizadas.
# para que quede bien en este ecenario, tenemos que ir a conectar esta señala 
# personalizada al otro nodo, en este caso a portal...
#signal abrir_portal()
# Nota: el simbolo "$" es similar a un metodo llamado get_node()

export var menu_game_over = "res://juego/menus/MenuGameOver.tscn"
export var nivel_actual = ""

var numero_llaves_zanahorias = 0

# Se puede hacer de varias formas una de ellas es esta linea comentada abajo. 
# el problema es que si no equivicamos en el nombre del contendor o lo borramos
# se podria producir un error, en la function _ready se relaiza dicho procedimiento.
#onready var contenedor_llaves_zanahorias = $Zanahorias
var contenedor_llaves_zanahorias
#onready var nubes_lejanas := $ParallaxBackground/ParallaxNubesLejanas

# Lo que hace el metodo get_node_or_null, es buscar el nodo, pero si no lo encuentra no tira error. 
# simplemente va a asiginarle a contenedor llave un nulo o tipo de dato null
func _ready(): 
	DatosPlayers.connect("game_over", self, "game_over")
	contenedor_llaves_zanahorias = get_node_or_null("Zanahorias")
	#print(contenedor_llaves_zanahorias.name)
	if contenedor_llaves_zanahorias != null: 
		numero_llaves_nivel()
		
		
#func _process(delta):
#	nubes_lejanas.motion_offset.x -= 5

	
func numero_llaves_nivel(): 
	numero_llaves_zanahorias = contenedor_llaves_zanahorias.get_child_count()
	DatosPlayers.contador_llaves(numero_llaves_zanahorias)
	#print(numero_llaves_zanahorias)
	for llave in contenedor_llaves_zanahorias.get_children(): 
		llave.connect("consumida", self, "llaves_restantes")
	
	
func llaves_restantes(): 
	numero_llaves_zanahorias -= 1
	#print(numero_llaves_zanahorias)
	if numero_llaves_zanahorias == 0: 
		print("abrir_portal")
		var portal = get_node_or_null("Portal")
		portal.play_animacion()
		#emit_signal("abrir_portal")


func game_over(): 
	DatosPlayers.nivel_actual = nivel_actual
	get_tree().change_scene(menu_game_over)
