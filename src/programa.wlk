import pasteleros.*
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
