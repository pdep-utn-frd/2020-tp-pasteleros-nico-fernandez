object programa {
	var property concursantes = [] 
	
	method elMasHabilidoso() {
		return concursantes.max({unConcursante => unConcursante.nivelDeHabilidad()})
	}
	
	method elMenosHabilidoso() {
		return concursantes.min({unConcursante => unConcursante.nivelDeHabilidad()})
	}
	
	method diferenciaMejorYPeor() {
		return self.elMasHabilidoso().nivelDeHabilidad() - self.elMenosHabilidoso().nivelDeHabilidad()
	}
}

object marcos {
	const aniosDeExperiencia = 6
	var property ingredientes = []
	
	method nivelDeHabilidad(){
		return aniosDeExperiencia + ingredientes.sum({unIngrediente => unIngrediente.cantidad()}) / 1000
	}
	
	method tieneUnBuenDia() {
		return self.nivelDeHabilidad() > 5
	}
	
	method puedePrepararSuPostreFavorito() {
		return ingredientes.size().even() and azucar.cantidad() >= 100 and self.tieneUnBuenDia()
		// Aqui tengo un warning en la constante azucar pero no se porque.
	}
}

// Uso una clase para los ingredientes ya que todos tienen en común el atributo cantidad.

class Ingrediente {
	var property cantidad

}

// Inicializo los ingredientes base.
const chocolate = new Ingrediente()
const azucar = new Ingrediente()
const harina = new Ingrediente()
const manteca = new Ingrediente()

object samanta {
	const property ingredientes = []
	
	method nivelDeHabilidad() {
		return 9
	}
	
	method puedePrepararSuPostreFavorito() {
		return false
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
	
	method puedePrepararSuPostreFavorito() {
		return ingredientes.contains(chocolate) and self.instrumento().suerte() > 5
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


