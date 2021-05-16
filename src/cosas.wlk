object knightRider {
	method peso() = 500 
	method nivelPeligrosidad() = 10
	method  totalBultos() = 1
	method consecuencia() {}
}

object bumblebee {
	var transformadoEnAuto = true
	method peso() = 800 
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method  totalBultos() = 2
	method consecuencia() { transformadoEnAuto = true }
}

object paqueteLadrillos{
	const property pesoLadrillo = 2
	var property cantidadLadrillos = 0
	method peso() = pesoLadrillo * cantidadLadrillos
	method nivelPeligrosidad() = 2
	method  totalBultos() {
		var totalBultos = 0
		if (cantidadLadrillos.between(1,100)) totalBultos = 1
		if (cantidadLadrillos.between(101,300)) totalBultos = 2
		if (cantidadLadrillos >= 301) totalBultos = 3
		return totalBultos		
	}
	method consecuencia() {cantidadLadrillos += 12 }
}


object arena {
	var property peso = 0
	method nivelPeligrosidad() = 1
	method totalBultos() = 1
	method consecuencia() { peso += 20}
}

object bateriaAntiarea {
	var property tieneMisiles = false
	method peso() = if (tieneMisiles) {300} else{200}
	method nivelPeligrosidad() = if (tieneMisiles) {100} else{0}
	method totalBultos() = if (tieneMisiles){2}else {1}
	method consecuencia() { tieneMisiles = true }
}

object contenedor {
	const property cosas = []
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method peso() = 100 + cosas.sum { c=> c.peso() }
	
	method nivelPeligrosidad() =
		if (cosas.isEmpty()) {0}
		else (cosas.max( { c=> c.nivelPeligrosidad() }).nivelPeligrosidad())
	
	method totalBultos() = 1 + cosas.sum { c => c.totalBultos()}
	
	method consecuencia() {
		cosas.forEach { c => c.consecuencia() }
	}
}

object residuosRadioactivos {
	var property peso = 0
	method nivelPeligrosidad() = 200
	method totalBultos() = 1
	method consecuencia() { peso += 15 } 
}

object embalajeSeguridad {
	var property cosa = nullCosaObject
	method peso() = cosa.peso()
	method nivelPeligrosidad() = cosa.nivelPeligrosidad() / 2
	method totalBultos() = 2
	method consecuencia() {}
}


object nullCosaObject {
	const property peso=0
	const property nivelPeligrosidad = 0
	const property totalBultos = 0
	method consecuencia() {}
}

