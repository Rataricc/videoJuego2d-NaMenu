extends Node
signal actualizar_datos()
signal game_over()

var vidas = 3
var monedaOro = 0 
var monedaPlata = 0
var monedaBronce = 0
var llaves = 0
var nivel_actual = ""
var puntaje = 0

func reset():
	vidas = 3
	monedaBronce = 0
	monedaOro = 0
	monedaPlata = 0
	puntaje = 0


func generar_puntaje(): 
	var valor_oro = monedaOro * 10
	var valor_plata = monedaPlata * 5
	var valor_bronce = monedaBronce * 2
	puntaje = valor_oro + valor_plata + valor_plata
	return puntaje


func restar_vidas_player(): 
	vidas -= 1
	if vidas == 0: 
		emit_signal("game_over")
	emit_signal("actualizar_datos")


func contador_llaves(valor):
	llaves = valor
	emit_signal("actualizar_datos")


func restar_llaves():
	llaves -= 1
	emit_signal("actualizar_datos")


# match == swich de otros lenguajes.
func sumar_monedas(moneda):
	match moneda: 
		"bronce": 
			monedaBronce += 1
		"plata": 
			monedaPlata += 1
		"oro":
			monedaOro += 1
		_:
			print("error")
	emit_signal("actualizar_datos")
