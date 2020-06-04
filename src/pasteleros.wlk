import jurado.*
import programa.*

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
	var property ingredientesUtilizados
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
		// Inicializo el contador de ingredientes en 0
		i = 0
		// Lo siguiente reinicia la cantidad de ingredientes para cuando quiera cambiar de torta
		ingredientesUtilizados = 0
		// Por cada ingrediente que tenga marcos ejecutar el metodo
		ingredientes.forEach({unIngrediente => self.calcularIngredientes(tipoDeTorta)})
		return ingredientesUtilizados
	}
	
	
	method calcularIngredientes(tipoDeTorta) {		
		var ingredienteEncontrado
		
		// Filtra una lista de un solo elemento, este elemento será algún ingrediente de marcos
		// cuyo tipo sea igual al tipo del ingrediente de la torta cuyo indice sea i (comienza en 0, el primer ingrediente)
		ingredienteEncontrado = ingredientes.filter({unIngrediente => unIngrediente.tipo() == tipoDeTorta.ingredientes().get(i).tipo()})
		
		// Si encontro alguno, es decir si la lista no es vacia entonces evalua las cantidades de ambos y acumula la menor.
		// Luego incrementa en 1 el indice para que pase al proximo ingrediente de la torta
		if (ingredienteEncontrado != []){
			ingredientesUtilizados += ingredientes.get(i).cantidad().min(tipoDeTorta.ingredientes().get(i).cantidad())
			i = (i + 1).min(tipoDeTorta.ingredientes().size())
			return ingredientesUtilizados
		}
		else
			// Si la lista es vacia entonces pasa al siguiente ingrediente pero no acumula nada.
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
	// Tiene dos ingredientes uno dulce y uno salado pero puede agregar mas.
	const property ingredientes = [
		new Ingrediente(tipo = "dulce de leche", cantidad = 800),
		new Ingrediente(tipo = "papas", cantidad = 700)
	]
	var property ingredientesUtilizados
	var property tiempoDeCoccionEmpleado
	
	
	// Su nivel de habilidad aumenta con respecto a la cantidad de oponentes que tenga en el concurso 
	// más la suma de las cantidades de sus ingredientes mas la suerte que le otorgue su sombrero de chef
	method nivelDeHabilidad() {
		return (programa.pasteleros().size() - 1) + (ingredientes.sum({unIngrediente => unIngrediente.cantidad()}) / 1000) + sombreroDeChef.suerte()
	}
	
	method agregar(unIngrediente) {
		ingredientes.add(unIngrediente)
	}
	
	// Puede preparar su postre favorito si su sombrero le da una suerte de al menos 5 y si dentro de sus ingredientes hay dulce 
	// de leche, ya que se lo pone a todo.
	method puedePrepararSuPostreFavorito() {
		return sombreroDeChef.suerte() > 5 and ingredientes.any({unIngrediente => unIngrediente.tipo() == "dulce de leche"})
	}
	
	// Para hacer la prueba tecnica, nicolas utiliza todo el dulce de leche que tiene y coloca solo 100 de los demas ingredientes.
	// No importa que la torta no lo requiera, el los coloca igual.
	// Su tiempo de cocción es el doble requerido por la torta.
	method hacerPruebaTecnicaDe(tipoDeTorta) {
		 ingredientesUtilizados = self.cantidadDeIngredienteFavoritoPara(tipoDeTorta) + self.cantidadDeLosDemasIngredientes()
		 tiempoDeCoccionEmpleado = tipoDeTorta.tiempoDeCoccion() * 2
	}
	
	method cantidadDeIngredienteFavoritoPara(tipoDeTorta) {
		var ingredienteDulceDeLeche
		ingredienteDulceDeLeche = ingredientes.findOrElse({unIngrediente => unIngrediente.tipo() == "dulce de leche"}, {""})
		
		if (ingredienteDulceDeLeche == "") {
			return 0
		}
		else
			return ingredienteDulceDeLeche.cantidad()
		
	}
	
	method cantidadDeLosDemasIngredientes() {
		ingredientes.removeAllSuchThat({unIngrediente => unIngrediente.tipo() == "dulce de leche"})
		return ingredientes.sum({unIngrediente => unIngrediente.cantidad().min(100)})
	}
}

object sombreroDeChef {
	const antiguedad = 4
	
	method suerte() {
		return antiguedad * 1.5
	}
}


