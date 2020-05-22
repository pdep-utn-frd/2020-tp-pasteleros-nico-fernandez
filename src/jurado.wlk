import pasteleros.*

object jurado {
	const property platos = [tortaWollok]
	
	method puntajeDe(pastelero, tipoDeTorta){
		return 10 - (tipoDeTorta.ingredientes().sum({unIngrediente => unIngrediente.cantidad()}) - pastelero.ingredientesUtilizados()) - (tipoDeTorta.tiempoDeCoccion() - pastelero.tiempoDeCoccionEmpleado())
	}
}

// 10 - (Cantidad de ingredientes de la torta requerida - cantidad de ingredientes utilizados)  - (Tiempo de cocción requerido - Tiempo de cocción empleado). 


object tortaWollok {
	const property ingredientes = [
		new Ingrediente(tipo = "chocolate", cantidad = 500),
		new Ingrediente(tipo = "harina", cantidad = 600),
		new Ingrediente(tipo = "azucar", cantidad = 300),
		new Ingrediente(tipo = "manteca", cantidad = 100)
	]
	const property tiempoDeCoccion = 50
	const property repostero = "Donato"
}
