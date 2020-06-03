import jurado.*

object programa {
	const property pasteleros = [marcos, sonia, samanta, nicolas]
	var pastelerosConPostreFavorito = [] 
	
	// El pastelero más habilidoso
	method elMasHabilidoso() {
		return pasteleros.max({unPastelero => unPastelero.nivelDeHabilidad()})
	}
	
	// El pastelero menos habilidoso
	method elMenosHabilidoso() {
		return pasteleros.min({unPastelero => unPastelero.nivelDeHabilidad()})
	}
	
	// Diferencia de habilidad entre el pastelero más habilidoso y menos habilidoso
	method diferenciaMejorYPeor() {
		return self.elMasHabilidoso().nivelDeHabilidad() - self.elMenosHabilidoso().nivelDeHabilidad()
	}
	
	// Coleccioón de pasteleros que pueden preparar su postre favorito
	method pastelerosQuePuedenPrepararPostreFavorito(){
		pastelerosConPostreFavorito = pasteleros.filter({unPastelero => unPastelero.puedePrepararSuPostreFavorito()})
	}
	
	// El pastelero mas habilidoso que puede preparar su postre favorito 
	method elMasHabilidosoConPostreFavorito() {
		return pastelerosConPostreFavorito.max({unPastelero => unPastelero.nivelDeHabilidad()})
	}
	
	// El pastelero menos habilidoso que puede preparar su postre favorito 
	method elMenosHabilidosoConPostreFavorito() {
		return pastelerosConPostreFavorito.min({unPastelero => unPastelero.nivelDeHabilidad()})
	}
	
	// Diferencia de habilidad entre los dos anteriores
	method diferenciaMejorYPeorconPostreFavorito() {
		return self.elMasHabilidosoConPostreFavorito().nivelDeHabilidad() - self.elMenosHabilidosoConPostreFavorito().nivelDeHabilidad()
	}
}


// Uso una clase para los ingredientes ya que todos tienen en común los atributos tipo y cantidad.
class Ingrediente {
	var property cantidad // en gramos
	var property tipo
	

}

object marcos {
	var property i = 0
	const property aniosDeExperiencia = 6
	const property ingredientes = [
		new Ingrediente(tipo = "chocolate", cantidad = 1200),
		new Ingrediente(tipo = "harina", cantidad = 400),
		new Ingrediente(tipo = "azucar", cantidad = 300)
	]
	var property ingredientesUtilizados = 0
	var property tiempoDeCoccionEmpleado
	
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

	method hacerPruebaTecnicaDe(tipoDeTorta){
		ingredientesUtilizados = self.cuantoNecesita(tipoDeTorta)
		tiempoDeCoccionEmpleado = tipoDeTorta.tiempoDeCoccion()
	}
	
	method cuantoNecesita(tipoDeTorta) {
		i = 0
		ingredientesUtilizados = 0
		ingredientes.forEach({unIngrediente => self.calcularIngredientes(tipoDeTorta)})
		return ingredientesUtilizados
	}
	
	
	method calcularIngredientes(tipoDeTorta) {		
		var ingredienteEncontrado
		ingredienteEncontrado = ingredientes.filter({unIngrediente => unIngrediente.tipo() == tipoDeTorta.ingredientes().get(i).tipo()})
		
		if (ingredienteEncontrado != []){
			ingredientesUtilizados += ingredientes.get(i).cantidad().min(tipoDeTorta.ingredientes().get(i).cantidad())
			i = (i + 1).min(tipoDeTorta.ingredientes().size())
			return ingredientesUtilizados
		}
		else
			i = (i + 1).min(tipoDeTorta.ingredientes().size())
			return 0

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
		 ingredientesUtilizados = self.cantidadDeIngredienteFavoritoPara(tipoDeTorta)
		 tiempoDeCoccionEmpleado = tipoDeTorta.tiempoDeCoccion() * 10 / self.nivelDeHabilidad()
	}
	
	// Funciona, pero revisar para mejoras.
	method cantidadDeIngredienteFavoritoPara(tipoDeTorta) {
		var ingredienteEnLaTorta 
		
		ingredienteEnLaTorta = tipoDeTorta.ingredientes().findOrElse({unIngrediente => unIngrediente.tipo() == ingrediente.tipo()}, {""})
		if (ingredienteEnLaTorta == "") {
			return 0
		}
		else 
			return ingredienteEnLaTorta.cantidad().min(ingrediente.cantidad())
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
	// Tiene dos ingredientes uno dulce y uno salado
	const property ingredientes = [
		new Ingrediente(tipo = "dulce de leche", cantidad = 800),
		new Ingrediente(tipo = "papas", cantidad = 700)
	]
	
	// Su nivel de habilidad aumenta con respecto a la cantidad de oponentes que tenga en el concurso 
	// más la suma de las cantidades de sus ingredientes mas la suerte que le otorgue su sombrero de chef
	method nivelDeHabilidad() {
		return (programa.pasteleros().size() - 1) + ingredientes.sum({unIngrediente => unIngrediente.cantidad()}) / 1000 + sombreroDeChef.suerte()
	}
	
	method agregar(unIngrediente) {
		ingredientes.add(unIngrediente)
	}
	
	// Puede preparar su ppostre favorito si su sombrero le da una suerte de almenos 5 y si dentro de sus ingredientes hay dulce 
	// de leche, ya que se lo pone a todo.
	method puedePrepararSuPostreFavorito() {
		return sombreroDeChef.suerte() > 5 and ingredientes.any({unIngrediente => unIngrediente.tipo() == "dulce de leche"})
	}
}

object sombreroDeChef {
	const antiguedad = 4
	
	method suerte() {
		return antiguedad * 1.5
	}
}


