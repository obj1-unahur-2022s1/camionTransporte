import cosas.*

object camion {
	const property cosas = []
	const property tara=1000
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.consecuencia()
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method hayAlgunoQuePesa (peso) {
		return cosas.any( { c => c.peso() == peso })
	}
	
	method  elDeNivel(nivel)  {
		return cosas.find ({c =>c.nivelPeligrosidad() == nivel})
	}
	
	method pesoTotal() {
		return tara + cosas.sum ( { c => c.peso()})
	}
	
	method excedidoDePeso () {
		return self.pesoTotal() > 2500
	}
	
	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({ c => c.nivelPeligrosidad() > nivel})
	}
	
	method  objetosMasPeligrososQue(cosa) {
		return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}
	
	method  puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and  
		self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
	
	
	
	method  tieneAlgoQuePesaEntre(min, max) = return cosas.any( { c => c.peso().between(min, max) } )
	method  cosaMasPesada() = return cosas.max( { c => c.peso() } )
	method  pesos() = return cosas.map( { c => c.peso() } )
	
	
	
	
}
