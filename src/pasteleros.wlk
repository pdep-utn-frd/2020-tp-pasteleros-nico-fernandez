object programa {
	var property concursantes = [] 
	
	method elMasHabilidoso() { // Me dice quien es el mas habilidoso
		return concursantes.max({unConcursante => unConcursante.nivelDeHabilidad()})
	}
	
	method elMenosHabilidoso() { // Me dice quien es el menos habilidoso
		return concursantes.min({unConcursante => unConcursante.nivelDeHabilidad()})
	}
	
	method diferenciaMejorYPeor() { // Me dice la diferencia entre los neiveles de habilidad de los anteriores.
		return self.elMasHabilidoso().nivelDeHabilidad() - self.elMenosHabilidoso().nivelDeHabilidad()
	}
}

object marcos {
	const aniosDeExperiencia = 6
	var property ingredientes = []
	
	method nivelDeHabilidad(){
		return aniosDeExperiencia + ingredientes.sum({unIngrediente => unIngrediente.cantidad()}) / 1000
	}
}

// Uso una clase para los ingredientes ya que todos tienen en común el atributo cantidad.

class Ingrediente {
	var property cantidad
}

object samanta {
	const property ingredientes = []
	method nivelDeHabilidad() {
		return 9
	}
}

object sonia {
	var property ingredientes = [] // Coleccion de uno, podria haber mas ingredientes
	var property instrumento = cuchara
	
	method nivelDeHabilidad() {
		return 10.min(1 + ingredientes.sum({unIngrediente => unIngrediente.cantidad()}) / 1000 + instrumento.suerte())
	}
	
	method descartarIngredientes() {
		ingredientes.clear()
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


