import pasteleros.*
import tortas.*

object jurado {
	const property platos = []
	const property pasteleros = [marcos, sonia, samanta, nicolas]
	var pastelerosConPostreFavorito = []
	var property tortaModelo // puedo cambiar la torta a preparar
	
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
	
	method presentarTorta(torta) {
		platos.add(torta)
	}
	
	//Cada participante debe elaborar una torta como la pedida, lo mejor que le salga, y presentársela al jurado.
	method realizarPruebaTecnica(){
		pasteleros.forEach{unPastelero => unPastelero.pruebaTecnica(tortaModelo)}
	}
	
	method puntosPara(torta){
		return 10 - (torta.cantidadTotal() - tortaModelo.cantidadTotal()).abs() - (torta.tiempoDeCoccion() - tortaModelo.tiempoDeCoccion()).abs()
	}
	
	method ganadorPruebaTecnica(){
		return platos.max({plato => self.puntosPara(plato)}).repostero()
	}

}


