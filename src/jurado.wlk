import pasteleros.*

object jurado {
	const property platos = [tortaWollok, lemonPie]
	
	method puntajeDe(pastelero, tipoDeTorta){
		return 10 - (tipoDeTorta.ingredientes().sum({unIngrediente => unIngrediente.cantidad()}) / 1000 - pastelero.ingredientesUtilizados()) / 1000  - (tipoDeTorta.tiempoDeCoccion() - pastelero.tiempoDeCoccionEmpleado())
	}
}

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

object lemonPie {
	const property ingredientes = [
		new Ingrediente(tipo = "limon", cantidad = 1100),
		new Ingrediente(tipo = "mousse", cantidad = 200),
		new Ingrediente(tipo = "azucar", cantidad = 500),
		new Ingrediente(tipo = "mermelada", cantidad = 100)
	]
	const property tiempoDeCoccion = 50
	const property repostero = "Donato"
}
