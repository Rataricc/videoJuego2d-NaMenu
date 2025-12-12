extends Control

onready var etiqueta_vidas = $ContenedorVidas/Cantidad

onready var etiqueta_monedas_oro = $ContenedorMonedaOro/Cantidad
onready var etiqueta_monedas_bronce = $ContenedorMonedaBronce/Cantidad
onready var etiqueta_monedas_plata = $ContenedorMonedaPlata/Cantidad
onready var etiqueta_llaves = $ContenedorLlaves/Cantidad

func _ready():
	DatosPlayers.connect("actualizar_datos", self, "actualizar_hud")
	actualizar_hud()

func actualizar_hud():
	etiqueta_vidas.text = "%s" % DatosPlayers.vidas
	etiqueta_monedas_oro.text = "%s" % DatosPlayers.monedaOro
	etiqueta_monedas_bronce.text = "%s" % DatosPlayers.monedaBronce
	etiqueta_monedas_plata.text = "%s" % DatosPlayers.monedaPlata
	etiqueta_llaves.text = "%s" % DatosPlayers.llaves
