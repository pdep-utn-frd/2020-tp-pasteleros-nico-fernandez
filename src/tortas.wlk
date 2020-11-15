import pasteleros.*

class Torta {
	
	const property ingredientes = []
	var property tiempoDeCoccion 
	var property repostero
		
	method agregarIngrediente(tipo, cantidad){
		ingredientes.add(new Ingrediente(tipo = tipo, cantidad = cantidad))
	}
	method cantidadTotal() = ingredientes.sum{unIngrediente => unIngrediente.cantidad()}

}

const tortaWollok = new Torta(
	ingredientes = [
		new Ingrediente(tipo = "chocolate", cantidad = 0.5),
		new Ingrediente(tipo = "harina", cantidad = 0.6),
		new Ingrediente(tipo = "azucar", cantidad = 0.3),
		new Ingrediente(tipo = "manteca", cantidad = 0.1)		
	],
	tiempoDeCoccion = 50,
	repostero = "Donato"
) 

const lemonPie = new Torta(
	ingredientes = [
		new Ingrediente(tipo = "limon", cantidad = 0.7),
		new Ingrediente(tipo = "mousse", cantidad = 0.3),
		new Ingrediente(tipo = "azucar", cantidad = 0.9),
		new Ingrediente(tipo = "escencia de vainilla", cantidad = 0.1)		
	],
	tiempoDeCoccion = 50,
	repostero = "Cristof"
)

const pastaFrola = new Torta(
	ingredientes = [
		new Ingrediente(tipo = "membrillo", cantidad = 0.3),
		new Ingrediente(tipo = "harina", cantidad = 0.8),
		new Ingrediente(tipo = "coco", cantidad = 0.2),
		new Ingrediente(tipo = "chocolate", cantidad = 0.4)		
	],
	tiempoDeCoccion = 50,
	repostero = "Carlitos"
)

const bombazo = new Torta(
	ingredientes = [
		new Ingrediente(tipo = "dulce de leche", cantidad = 1)
		//new Ingrediente(tipo = "papas", cantidad = 0.1),
		//new Ingrediente(tipo = "maiz", cantidad = 0.3),
		//new Ingrediente(tipo = "pescado", cantidad = 0.2)		
	],
	tiempoDeCoccion = 10,
	repostero = "Jeronimo"
)