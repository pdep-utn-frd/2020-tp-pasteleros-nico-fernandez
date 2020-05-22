import jurado.*

object programa {
	const pasteleros = [marcos, sonia, samanta] 
	
	method elMasHabilidoso() {
		return pasteleros.max({unPastelero => unPastelero.nivelDeHabilidad()})
	}
	
	method elMenosHabilidoso() {
		return pasteleros.min({unPastelero => unPastelero.nivelDeHabilidad()})
	}
	
	method diferenciaMejorYPeor() {
		return self.elMasHabilidoso().nivelDeHabilidad() - self.elMenosHabilidoso().nivelDeHabilidad()
	}
}


// Uso una clase para los ingredientes ya que todos tienen en común los atributos tipo y cantidad.
class Ingrediente {
	var property cantidad // en gramos
	var property tipo
}

object marcos {
	const property aniosDeExperiencia = 6
	const property ingredientes = [
		new Ingrediente(tipo = "chocolate", cantidad = 1200),
		new Ingrediente(tipo = "harina", cantidad = 400),
		new Ingrediente(tipo = "azucar", cantidad = 300)
	]
	var property ingredientesUtilizados = 0
	var property tiempoDeCoccionEmpleado = 30
	
	method nivelDeHabilidad(){
		return (aniosDeExperiencia + ingredientes.sum({unIngrediente => unIngrediente.cantidad()}) / 1000).min(10)
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
	
	method agregar(unIngrediente) {
		ingredientes.add(unIngrediente)
	}

	// TO DO
	method hacerPruebaTecnicaDe(tipoDeTorta){
		ingredientesUtilizados = self.cantidadDeIngredientesPara(tipoDeTorta)
		tiempoDeCoccionEmpleado = tipoDeTorta.tiempoDeCoccion()
	}
	
	// TO DO
	method cantidadDeIngredientesPara(tipoDeTorta) {
		return (tipoDeTorta.ingredientes().sum({unIngrediente => unIngrediente.cantidad()})).min(self.ingredientes().sum({unIngrediente => unIngrediente.cantidad()}))
	}
}

object samanta {
	const property ingredientes = []
	var property ingredientesUtilizados
	var property tiempoDeCoccionEmpleado
	
	method nivelDeHabilidad() {
		return 9
	}
	
	method puedePrepararSuPostreFavorito() {
		return false
	}
	
	method tiempoDeCoccion() {
		return 50
	}
	
	method hacerPruebaTecnicaDe(tipoDeTorta){
		ingredientesUtilizados = 0
		tiempoDeCoccionEmpleado = 30
	}
	
	
}

object sonia {
	var property ingrediente = new Ingrediente(tipo = "chocolate", cantidad = 1000)
	var property instrumento = cuchara
	var property ingredientesUtilizados
	var property tiempoDeCoccionEmpleado
	
	method nivelDeHabilidad() {
		return (1 + ingrediente.cantidad() / 1000 + instrumento.suerte()).min(10)
	}
	
	method cambiar(unIngrediente) {
		ingrediente = unIngrediente
	}
	
	method puedePrepararSuPostreFavorito() {
		return ingrediente.tipo() == "chocolate" and instrumento.suerte() > 5
	}
	
	method hacerPruebaTecnicaDe(tipoDeTorta) {
		 ingredientesUtilizados = self.cantidadDeIngredienteFavorito(tipoDeTorta)
		 tiempoDeCoccionEmpleado = tipoDeTorta.tiempoDeCoccion() * 10 / self.nivelDeHabilidad()
	}
	
	method cantidadDeIngredienteFavorito(tipoDeTorta) {
		return (tipoDeTorta.ingredientes().sum({unIngrediente => unIngrediente.cantidad()})).min(ingrediente.cantidad())
		// Evalua la cantidad de los ingredientes de la torta y lo compara con la cantidad de su ingrediente favorito,
		// luego retorna la cantidad menor. 
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
	
}


