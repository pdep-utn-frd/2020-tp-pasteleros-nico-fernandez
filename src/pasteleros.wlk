import jurado.*
import tortas.*

// Uso una clase para los ingredientes ya que todos tienen en común los atributos tipo y cantidad.
class Ingrediente {
	var property cantidad // en kilogramos
	var property tipo
	
	method aumentarPeso(incremento) {
		cantidad += incremento
	}
}

object marcos {
	const property aniosDeExperiencia = 6
	const property ingredientes = [
		new Ingrediente(tipo = "chocolate", cantidad = 1.2),
		new Ingrediente(tipo = "harina", cantidad = 0.4),
		new Ingrediente(tipo = "azucar", cantidad = 0.3)
	]
	
	method nivelDeHabilidad(){
		return aniosDeExperiencia + self.cantidadIngredientes()
	}
	
	method cantidadIngredientes() {
		return ingredientes.sum({unIngrediente => unIngrediente.cantidad()})
	}
	
	method agregarIngrediente(tipo, cantidad) {
		ingredientes.add(new Ingrediente(tipo = tipo, cantidad = cantidad))
	}
	
	method tieneSuficiente(tipo, cantidad) {
		return ingredientes.any({unIngrediente => unIngrediente.tipo() == tipo and unIngrediente.cantidad() >= cantidad})
	}
	
	method tieneUnBuenDia() {
		return self.nivelDeHabilidad() > 5
	}
	
	method puedePrepararSuPostreFavorito() {
		return ingredientes.size().even() and self.tieneSuficiente("azucar", 100) and self.tieneUnBuenDia()
	}
	
	method pruebaTecnica(tipoDeTorta) {
		const nuevaTorta = new Torta(tiempoDeCoccion = tipoDeTorta.tiempoDeCoccion(), repostero = self)
		tipoDeTorta.ingredientes().forEach({unIngrediente => self.colocarIngrediente(tipoDeTorta, unIngrediente)})
		jurado.presentarTorta(nuevaTorta)
	}
	
	method colocarIngrediente(tipoDeTorta, ingrediente) {
		tipoDeTorta.agregarIngrediente(ingrediente.tipo(), ingrediente.cantidad().min(self.cuantoTieneDe(ingrediente.cantidad())))
	}
	
	method cuantoTieneDe(tipo) {
		return ingredientes.findOrDefault({unIngrediente => unIngrediente.tipo() == tipo}, new Ingrediente(tipo = "", cantidad = 0)).cantidad()
	}
}

object samanta {
	
	method nivelDeHabilidad() {
		return 9
	}
	
	method puedePrepararSuPostreFavorito() {
		return false
	}
	
	// Samanta no tiene ingredientes
	method pruebaTecnica(tipoDeTorta){
		jurado.presentarTorta(new Torta(tiempoDeCoccion = 30, repostero = self))
	}
	
	
}

object sonia {
	var property ingrediente = new Ingrediente(tipo = "chocolate", cantidad = 1)
	var property instrumento = cuchara

	
	method nivelDeHabilidad() {
		return (1 + ingrediente.cantidad() + instrumento.suerte()).min(10)
	}
	
	method cambiar(unIngrediente) {
		ingrediente = unIngrediente
	}
	
	method agregarCantidad(incremento) {
		ingrediente.aumentarCantidad(incremento) 
	}
	
	method puedePrepararSuPostreFavorito() {
		return ingrediente.tipo() == "chocolate" and instrumento.suerte() > 5
	}
	
	method pruebaTecnica(tipoDeTorta){
		jurado.presentarTorta(
			new Torta (
				ingredientes = [new Ingrediente(tipo = ingrediente.tipo(), cantidad = tipoDeTorta.cantidadTotal())],
				tiempoDeCoccion = (10 * tipoDeTorta.tiempoDeCoccion()) / self.nivelDeHabilidad(),
				repostero = self
			)
		)
	}
	
}

object cuadernoDeRecetas {
	var property paginas = 4 // Puede añadir mas páginas a su cuaderno
	
	method suerte() {
		return paginas
	}
} 

object cuchara {
		
	method suerte() {
		return 2
	}
}

object nicolas {
	const property aniosDeExperiencia = 6
	// Tiene solo dos ingredientes uno dulce y otro salado, pero puede agragar más.
	const property ingredientes = [
		new Ingrediente(tipo = "dulce de leche", cantidad = 0.9),
		new Ingrediente(tipo = "papas", cantidad = 0.1)
	]

	// Su nivel de habilidad aumenta con respecto a la cantidad de oponentes que tenga en el concurso 
	// más la suma de las cantidades de sus ingredientes mas la suerte que le otorgue su sombrero de chef
	method nivelDeHabilidad() {
		return (jurado.pasteleros().size() - 1) + (ingredientes.sum({unIngrediente => unIngrediente.cantidad()}) / 1000) + sombreroDeChef.suerte()
	}
	
	
	// Puede preparar su postre favorito si su sombrero le da una suerte de al menos 5 y si dentro de sus ingredientes hay dulce 
	// de leche, ya que se lo pone a todo.
	method puedePrepararSuPostreFavorito() {
		return sombreroDeChef.suerte() > 5 and ingredientes.any({unIngrediente => unIngrediente.tipo() == "dulce de leche"})
	}

	
	// Para hacer la prueba tecnica, nicolas utiliza todos los ingredientes que tiene y coloca todo, no importa si se pasa o 
	// le falta.
	// Su tiempo de cocción la mitad del requerido por la torta.
	method pruebaTecnica(tipoDeTorta) {
		const tortaDeNicolas = new Torta(tiempoDeCoccion = tipoDeTorta.tiempoDeCoccion(), repostero = self)
		tipoDeTorta.ingredientes().forEach({unIngrediente => self.ponerIngrediente(tipoDeTorta, unIngrediente)})
		jurado.presentarTorta(tortaDeNicolas)
	}
	
	method agregarIngrediente(tipo, cantidad) {
		ingredientes.add(new Ingrediente(tipo = tipo, cantidad = cantidad))
	}
	
	method ponerIngrediente(tipoDeTorta, ingrediente) {
		tipoDeTorta.agregarIngrediente(ingrediente.tipo(), ingrediente.cantidad())
	}
	
}

object sombreroDeChef {
	const antiguedad = 4
	
	method suerte() {
		return antiguedad * 1.5
	}
}


